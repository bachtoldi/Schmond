'use strict';
app.controller('raceController', ['$scope', '$rootScope', '$http', function ($scope, $rootScope, $http) {
	
	$scope.initIndex = function () {
		$rootScope.title = 'Rassen';

		$rootScope.loading = true;
		$http.get('/api/races').success(function (response) {
			$rootScope.loading = false;
			$scope.races = response;
		}).error(function (err) {
			$rootScope.loading = false;
			$rootScope.state = 'error';
			$rootScope.modalHeader = 'Fehler';
			$rootScope.modalMessage = err;
			$rootScope.modalLink = 'javascript:void()';
			$('#modal').openModal();
		});
	}

	$scope.show = function (race) {
		if (race == null) {
			$scope.race = {
				name: ''
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
		
		if ($scope.race.id == undefined) {
			$http.post('/api/races', $scope.race).success(function () {
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
			$http.put('/api/races/' + $scope.race.id, $scope.race).success(function () {
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