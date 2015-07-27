'use strict';
app.controller('classController', ['$scope', '$rootScope', '$http', function ($scope, $rootScope, $http) {

	$scope.initIndex = function () {
		$scope.page.setTitle('Klassen');

		$rootScope.loading = true;
		$http.get('/api/classes').success(function (response) {
			$rootScope.loading = false;
			$scope.classes = response;
		}).error(function (err) {
			$rootScope.loading = false;
			$rootScope.state = 'error';
			$rootScope.modalHeader = 'Fehler';
			$rootScope.modalMessage = err;
			$rootScope.modalLink = 'javascript:void()';
			$('#modal').openModal();
		});
	}

	// if the object references are not the same, no checkboxes are selected in editmode
	var findReferences = function (targets, sources) {
		var results = [];
		angular.forEach(targets, function (target) {
			angular.forEach(sources, function (source) {
				if (source.id === target.id) {
					results.push(source);
				}
			});
		});
		return results;
	};

	$scope.show = function (object) {
		$http.get('/api/races').success(function (response) {
			$scope.races = response;
			if (object == null) {
				$scope.class = {
					name: '',
					races: []
				}
			} else {
				object.races = findReferences(object.races, $scope.races);
				$scope.class = angular.copy(object);
				$scope.master = angular.copy(object);
			}
			$scope.reset = function () {
				$scope.class = angular.copy($scope.master);
			};
			$('#edit').openModal();
		}).error(function (err) {
			$rootScope.state = 'error';
			$rootScope.modalHeader = 'Fehler';
			$rootScope.modalMessage = err;
			$rootScope.modalLink = 'javascript:void()';
			$('#modal').openModal();
		});
	}
	
	$scope.save = function () {
		$rootScope.loading = true;

		var fd = {
			name: $scope.class.name,
			availableRaces: $scope.class.races
		};

		if ($scope.class.id == undefined) {
			$http.post('/api/classes', fd).success(function () {
				$rootScope.loading = false;
				$scope.initIndex(); // reload 
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
			$http.put('/api/classes/' + $scope.class.id, fd).success(function () {
				$rootScope.loading = false;
				$scope.initIndex(); // reload 
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

	$scope.delete = function (object) {
		$rootScope.loading = true;

		$http.delete('/api/classes/' + object.id).success(function () {
			$rootScope.loading = false;
			$scope.initIndex(); // reload
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