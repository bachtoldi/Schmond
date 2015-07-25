(function () {
	'use strict';

	var app = angular.module('schmond.controllers');

	app.controller('lootlistController', ['bossService', 'itemService', '$routeParams', function (bossService, itemService, $routeParams) {
		var vm = this;

		bossService.getBossesByInstance($routeParams.id).then(function (response) {
			vm.bosses = response;
		});

		vm.expand = function (boss) {
			itemService.getItemsForBoss(boss).then(function (response) {
				vm.items = response;
				console.log(response);
			});
		}

	}]);
}());