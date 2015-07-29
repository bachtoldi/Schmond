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

		if (!vm.authentication.mainCharId) {
			$location.path('/login');
		}

		$scope.$on('$routeChangeStart', function (next, current) {
			console.log(next);
			$location.path('/chars');
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