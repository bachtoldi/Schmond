'use strict';
app.controller('accountController', ['$scope', '$rootScope', '$http', '$location', '$timeout', 'authService', function ($scope, $rootScope, $http, $location, $timeout, authService) {

	$scope.initRegister = function () {
		$scope.page.setTitle('Registrieren');
	}

	$scope.initLogin = function () {
		$scope.page.setTitle('Anmelden');
	}

	$scope.initIndex = function () {
		$scope.page.setTitle('Mitglieder');

		$http.get('/api/accounts').success(function (response) {
			$scope.accounts = response;
			$rootScope.loading = false;
		});
	}

	$scope.register = function () {
		$rootScope.loading = true;
		$http.post('/api/accounts', $scope.user).success(function () {
			$rootScope.loading = false;
			$location.path('/char/create');
		});
	}

	$scope.login = function () {
		$rootScope.loading = true;

		authService.login($scope.user).then(function () {
			$rootScope.loading = false;
			$location.path('/players');
		});
	}
}]);