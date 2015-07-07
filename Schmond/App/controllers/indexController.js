'use strict';
app.controller('indexController', ['$scope', '$rootScope', '$http', '$location', 'authService', function ($scope, $rootScope, $http, $location, authService) {
	$rootScope.message = '';
	$scope.authentication = authService.authentication;

	$scope.isActive = function (viewLocation) {
		return viewLocation === $location.path();
	};

	$scope.getDateNow = function () {
		return new Date();
	};
}]);