'use strict';
app.controller('accountController', ['$scope', '$rootScope', '$http', '$location', '$timeout', 'authService', function ($scope, $rootScope, $http, $location, $timeout, authService) {

	var redirect = function (path) {
		var timer = $timeout(function () {
			$timeout.cancel(timer);
			$rootScope.message = '';
			$location.path(path);
		}, 5000);
	};

	$scope.initRegister = function () {
		$rootScope.title = 'Registrieren';
	}

	$scope.initLogin = function () {
		$rootScope.title = 'Anmelden';
	}

	$scope.register = function () {
		$rootScope.loading = true;
		$http.post('/api/accounts', $scope.user).success(function () {
			$rootScope.modalHeader = 'Erfolgreich';
			$rootScope.modalMessage = 'Vielen Dank für Ihre Registrierung.';
			$rootScope.modalLink = '/#/login';
			$('#modal').openModal();
		}).error(function (err) {
			$rootScope.state = 'error';
			$rootScope.modalHeader = 'Fehler';
			$rootScope.modalMessage = err;
			$rootScope.modalLink = 'javascript:void()';
			$('#modal').openModal();
		});

		$rootScope.loading = false;
	}

	$scope.login = function () {
		$rootScope.loading = true;

		authService.login($scope.user).then(function () {
			$rootScope.loading = false;
			$rootScope.modalHeader = 'Erfolgreich';
			$rootScope.modalMessage = 'Erfolgreich angemeldet!';
			$('#modal').openModal();
		},
		 function (err) {
		 	$rootScope.loading = false;
		 	$rootScope.modalHeader = 'Anmeldung fehlgeschlagen';
		 	$rootScope.modalMessage = err.error_description;
		 	$rootScope.modalLink = 'javascript:void()';
		 	$('#modal').openModal();
		 });

		$rootScope.loading = false;
	}
}]);