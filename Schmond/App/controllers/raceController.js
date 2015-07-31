'use strict';
app.controller('raceController', ['$scope', '$rootScope', '$http', 'raceService', function ($scope, $rootScope, $http, raceService) {

	$scope.initIndex = function () {
		$scope.page.setTitle('Rassen');

		$rootScope.loading = true;

		raceService.getRaces().then(function (response) {
			$rootScope.loading = false;
			$scope.races = response;
		});
	}

	$scope.show = function (race) {
		$http.get('/api/factions').success(function (response) {
			$scope.factions = response;
		}).error(function (err) {
			$rootScope.state = 'error';
			$rootScope.modalHeader = 'Fehler';
			$rootScope.modalMessage = err;
			$rootScope.modalLink = 'javascript:void()';
			$('#modal').openModal();
		});

		if (race == null) {
			$scope.race = {
				name: '',
				factionId: 0
			}
		} else {
			$scope.race = angular.copy(race);
			$scope.master = angular.copy(race);
		}

		$scope.reset = function () {
			$scope.user = angular.copy($scope.master);
		};

		$('#edit').openModal();
	}

	$scope.save = function () {
		$rootScope.loading = true;

		var fd = {
			name: $scope.race.name,
			factionId: $scope.race.faction.id
		};

		if ($scope.race.id == undefined) {
			$http.post('/api/races', fd).success(function () {
				$rootScope.loading = false;
				$scope.initIndex(); // reload races
				$('#edit').closeModal();
			}).error(function (err) {
				console.log(err);
				$rootScope.loading = false;
				$rootScope.state = 'error';
				$rootScope.modalHeader = 'Fehler';
				$rootScope.modalMessage = err;
				$rootScope.modalLink = 'javascript:void()';
				$('#modal').openModal();
			});
		} else {
			$http.put('/api/races/' + $scope.race.id, fd).success(function () {
				$rootScope.loading = false;
				$scope.initIndex(); // reload races
				$('#edit').closeModal();
			}).error(function (err) {
				$rootScope.loading = false;
				$rootScope.state = 'error';
				$rootScope.modalHeader = 'Fehler';
				$rootScope.modalMessage = err;
				$rootScope.modalLink = 'javascript:void()';
				$('#modal').openModal();
			});
		}
	}

	$scope.delete = function (race) {
		$rootScope.loading = true;

		$http.delete('/api/races/' + race.id).success(function () {
			$rootScope.loading = false;
			$scope.initIndex(); // reload races
		}).error(function (err) {
			$rootScope.loading = false;
			$rootScope.state = 'error';
			$rootScope.modalHeader = 'Fehler';
			$rootScope.modalMessage = err;
			$rootScope.modalLink = 'javascript:void()';
			$('#modal').openModal();
		});

	}
}]);