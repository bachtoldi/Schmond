'use strict';
app.factory('authService', ['$http', '$q', 'localStorageService', '$location', 'ngAuthSettings', function ($http, $q, localStorageService, $location, ngAuthSettings) {

	var serviceBase = ngAuthSettings.apiServiceBaseUri;
	var authServiceFactory = {};

	var authentication = {
		isAuth: false,
		userName: '',
		useRefreshTokens: false,
		mainCharId: ''
	};

	var saveRegistration = function (registration) {
		return $http.post(serviceBase + 'api/accounts', registration).then(function (response) {
			return response;
		});
	};

	var updateProfile = function (profile) {
		return $http.put(serviceBase + 'api/accounts', profile).then(function (response) {
			return response;
		});
	};

	var logOut = function () {

		localStorageService.remove('authorizationData');

		authentication.isAuth = false;
		authentication.userName = '';
		authentication.useRefreshTokens = false;
		authentication.mainCharId = '';
		$location.path('/login');
	};
	
	var login = function (loginData) {

		var data = 'grant_type=password&username=' + loginData.userName + '&password=' + loginData.password;

		if (loginData.useRefreshTokens) {
			data = data + '&client_id=' + ngAuthSettings.clientId;
		}

		var deferred = $q.defer();

		$http.post('/api/token', data, { headers: { 'Content-Type': 'application/x-www-form-urlencoded' } }).success(function (response) {
			if (loginData.useRefreshTokens) {
				localStorageService.set('authorizationData', { token: response.access_token, userName: loginData.userName, refreshToken: response.refresh_token, mainCharId: response.mainCharId, useRefreshTokens: true });
			}
			else {
				localStorageService.set('authorizationData', { token: response.access_token, userName: loginData.userName, refreshToken: '', mainCharId: response.mainCharId, useRefreshTokens: false });
			}
			authentication.isAuth = true;
			authentication.userName = loginData.userName;
			authentication.useRefreshTokens = loginData.useRefreshTokens;
			authentication.mainCharId = response.mainCharId;

			deferred.resolve(response);
		}).error(function (err) {
			logOut();
			deferred.reject(err);
		});

		return deferred.promise;

	};

	var fillAuthData = function () {

		var authData = localStorageService.get('authorizationData');
		
		if (authData) {
			authentication.isAuth = true;
			authentication.userName = authData.userName;
			authentication.useRefreshTokens = authData.useRefreshTokens;
			authentication.mainCharId = authData.mainCharId;
		}
	};

	var refreshToken = function () {
		var deferred = $q.defer();

		var authData = localStorageService.get('authorizationData');

		if (authData) {

			if (authData.useRefreshTokens) {

				var data = 'grant_type=refresh_token&refresh_token=' + authData.refreshToken + '&client_id=' + ngAuthSettings.clientId;

				localStorageService.remove('authorizationData');

				$http.post('/api/token', data, { headers: { 'Content-Type': 'application/x-www-form-urlencoded' } }).success(function (response) {

					localStorageService.set('authorizationData', { token: response.access_token, userName: response.userName, refreshToken: response.refresh_token, useRefreshTokens: true, mainCharId: response.mainCharId });
					deferred.resolve(response);

				}).error(function (err) {
					logOut();
					deferred.reject(err);
				});
			}
		}

		return deferred.promise;
	};

	authServiceFactory.saveRegistration = saveRegistration;
	authServiceFactory.login = login;
	authServiceFactory.logOut = logOut;
	authServiceFactory.fillAuthData = fillAuthData;
	authServiceFactory.authentication = authentication;
	authServiceFactory.refreshToken = refreshToken;
	authServiceFactory.updateProfile = updateProfile;

	return authServiceFactory;
}]);