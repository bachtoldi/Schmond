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
			$rootScope.state = 'success';
			$rootScope.message = 'Registrierung erfolgreich abgeschlossen! In 5 Sekunden werden Sie zur Anmeldung weitergeleitet.';
			redirect('/login');
		}).error(function (err) {
			$rootScope.state = 'error';
			$rootScope.message = err;
		});

		$rootScope.loading = false;
	}

	$scope.login = function () {
		$rootScope.loading = true;

		authService.login($scope.user).then(function () {
			$rootScope.loading = false;
			$rootScope.state = 'success';
			$rootScope.message = 'Erfolgreich angemeldet! In 5 Sekunden werden Sie weitergeleitet.';
			$location.path('/login');
		},
		 function (err) {
		 	$rootScope.loading = false;
		 	$rootScope.state = 'error';
		 	$rootScope.message = err.error_description;
		 });

		$rootScope.loading = false;
	}
}]);