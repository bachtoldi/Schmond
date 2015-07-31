(function () {
	'use strict';

	angular.module('schmond.controllers')
		.controller('charController', ['$scope', 'raceService', 'classService', 'charService', 'specService', 'authService', '$location', 'localStorageService', function ($scope, raceService, classService, charService, specService, authService, $location, localStorageService) {
			var vm = this;

			vm.char = {
				name: '',
				raceId: '',
				classId: '',
				specId: ''
			}

			$scope.page.setTitle('Charakter');

			raceService.getRaces().then(function (response) {
				vm.races = response;

				setTimeout(function () { // todo: replace timeout with better solution
					$('#race').material_select();
					$('#class').material_select();
					$('#spec').material_select();
				}, 1);
			});

			vm.loadClasses = function () {
				classService.getClassesByRace(vm.char.raceId).then(function (response) {
					vm.char.classId = ''; // reset class, so it must be set by user
					vm.classes = response;

					setTimeout(function () { // todo: replace timeout with better solution
						$('#class').material_select();
					}, 1);
				});
			}

			vm.loadSpecs = function () {
				specService.getSpecsByClass(vm.char.classId).then(function (response) {
					vm.char.specId = ''; // reset class, so it must be set by user
					vm.specs = response;

					setTimeout(function () { // todo: replace timeout with better solution
						$('#spec').material_select();
					}, 1);
				});
			}

			vm.createChar = function () {
				charService.create(vm.char).then(function (response) {
					authService.authentication.mainCharId = response;
					localStorageService.set('authorizationData', { mainCharId: response });
					$location.path('/players');
					// TODO: redirect to previous URL
				});
			}
		}]);
}());