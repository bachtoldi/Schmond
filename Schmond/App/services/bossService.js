(function () {
	'use strict';

	var app = angular.module('Schmond');

	app.factory('bossService', ['$http', '$q', '$rootScope', '$location', 'ngAuthSettings', function ($http, $q, $rootScope, $location, ngAuthSettings) {
		var factory = {};

		var getBossesByInstance = function (instanceId) {
			var deferred = $q.defer();

			$http.get('/api/boss?instanceId=' + instanceId).success(function (response) {
				deferred.resolve(response);
			}).error(function (err) {
				deferred.reject(err);
			});

			return deferred.promise;
		}

		factory.getBossesByInstance = getBossesByInstance;

		return factory;
	}]);
}());