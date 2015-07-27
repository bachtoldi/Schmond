(function () {
	'use strict';

	var app = angular.module('schmond.controllers', []);

	app.controller('indexController', ['$scope', '$rootScope', '$http', '$location', 'authService', function ($scope, $rootScope, $http, $location, authService) {

		this.init = function () {
			$rootScope.modalMessage = '';
			$rootScope.modalHeader = '';
			$rootScope.modalLink = '#!';
			$rootScope.tabs = [];
		}

		this.authentication = authService.authentication;
		this.footerLinks = [
			{
				text: 'Impressum',
				url: '/#/imprint'
			}
		];
		
		$scope.logOut = function () {
			authService.logOut();
			$location.path('/login');
		}

		$scope.isActive = function (viewLocation) {
			return $location.path().indexOf(viewLocation) > -1;
		};
	}]);
}());