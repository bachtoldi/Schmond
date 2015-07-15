'use strict';
app.controller('classController', ['$scope', '$rootScope', '$http', function ($scope, $rootScope, $http) {

	$scope.initIndex = function () {
		$rootScope.title = 'Klassen';

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

	$scope.show = function (object) {
		if (object == null) {
			$scope.class = {
				name: ''
			}
		} else {
			$scope.class = angular.copy(object);
			$scope.master = angular.copy(object);
		}

		$scope.reset = function () {
			$scope.class = angular.copy($scope.master);
		};

		$('#edit').openModal();
	}

	$scope.save = function () {
		$rootScope.loading = true;

		if ($scope.class.id == undefined) {
			$http.post('/api/classes', $scope.class).success(function () {
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
			$http.put('/api/classes/' + $scope.class.id, $scope.class).success(function () {
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