 (function () {
	'use strict';

	var app = angular.module('schmond.controllers');

	app.controller('lootlistController', ['bossService', '$routeParams', function (bossService, $routeParams) {
		var vm = this;

		bossService.getBossesByInstance($routeParams.id).then(function (response) {
			vm.bosses = response;
			console.log(response);
		});

	}]);
}());