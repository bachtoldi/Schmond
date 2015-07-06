'use strict';
app.controller('indexController', ['$scope', '$rootScope', '$http', '$location', function ($scope, $rootScope, $http, $location) {
	$scope.isActive = function (viewLocation) {
		return viewLocation === $location.path();
	};

	$scope.getDateNow = function () {
		return new Date();
	};
}]);