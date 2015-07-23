(function () {
	'use strict';

	var app = angular.module('schmond.controllers', []);

	app.controller('indexController', ['$scope', '$rootScope', '$http', '$location', 'authService', function ($scope, $rootScope, $http, $location, authService) {
		$rootScope.modalMessage = '';
		$rootScope.modalHeader = '';
		$rootScope.modalLink = '#!';
		this.authentication = authService.authentication;
		this.footerLinks = [
			{
				text: 'Impressum',
				url: '/#/imprint'
			}
		];
		this.headerLinks = [
			{
				text: 'Mein Profil',
				url: '/#/profile',
				authorize: false
			},
			{
				text: 'Abmelden',
				url: '',
				authorize: false
			},
			{
				text: 'Registrieren',
				url: '/#/register',
				authorize: true
			},
			{
				text: 'Anmelden',
				url: '/#/login',
				authorize: true
			}
		];


		$scope.logOut = function () {
			authService.logOut();
			$location.path('/login');
		}

		$scope.isActive = function (viewLocation) {
			return $location.path().indexOf(viewLocation) > -1;
		};
	}
	]);
}());