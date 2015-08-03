(function () {
	'use strict';

	var app = angular.module('schmond.controllers');

	app.controller('lootlistController', ['$scope', '$rootScope', 'instanceService', 'bossService', 'itemService', 'needTypeService', 'charService', 'authService', 'specService', '$routeParams', function ($scope, $rootScope, instanceService, bossService, itemService, needTypeService, charService, authService, specService, $routeParams) {
		var vm = this;

		vm.initIndex = function () {
			instanceService.getInstanceById($routeParams.instance).then(function (response) {
				$scope.page.setTitle(response.name);
			});

			bossService.getBossesByInstance($routeParams.instance).then(function (response) {
				vm.bosses = response;
			});
		}

		vm.initBoss = function () {
			$scope.page.setGoBack('/#/lootlists/' + $routeParams.instance);

			bossService.getBossById($routeParams.boss).then(function (response) {
				$scope.page.setTitle(response.name);
			});

			itemService.getItemsForBoss($routeParams.boss).then(function (response) {
				vm.items = response;
			});

			needTypeService.getNeedTypes().then(function (response) {
				vm.needTypes = response;
			});

			vm.show = function (id) {
				$('#config-' + id).openModal();
			}

			// loads specs for configuration
			charService.getCharById(authService.authentication.mainCharId).then(function(character) {
				if (character) {
					specService.getSpecsByClass(character.spec.classId).then(function (specs) {
						vm.specs = specs;
					});
				}
			});
		}
	}]);
}());