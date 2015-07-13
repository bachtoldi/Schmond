'use strict';
app.controller('raceController', ['$scope', '$rootScope', '$http', '$location', '$timeout', 'authService', function ($scope, $rootScope, $http, $location, $timeout, authService) {

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
}]);