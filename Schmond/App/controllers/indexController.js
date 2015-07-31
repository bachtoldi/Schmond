(function () {
	'use strict';

	var app = angular.module('schmond.controllers', []);

	app.controller('indexController', ['$scope', '$rootScope', '$http', '$location', 'authService', function ($scope, $rootScope, $http, $location, authService) {
		var vm = this;

		$rootScope.modalMessage = '';
		$rootScope.modalHeader = '';
		$rootScope.modalLink = '#!';
		$rootScope.tabs = [];

		vm.authentication = authService.authentication;

		$scope.$on('$routeChangeStart', function (next, current) {
			if (authService.authentication.isAuth && !authService.authentication.mainCharId) {
				$location.path('/chars');
			}
		});

		$scope.logOut = function () {
			authService.logOut();
			$location.path('/login');
		}

		$scope.isActive = function (viewLocation) {
			return $location.path().indexOf(viewLocation) > -1;
		};
	}]);
}());