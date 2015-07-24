(function () {
	'use strict';

	app.controller('instanceController', ['$scope', '$rootScope', '$http', 'instanceService', 'authService', function ($scope, $rootScope, $http, instanceService, authService) {

		var vm = this;

		instanceService.getInstances().then(function (response) {
			vm.instances = response;
		});
	}]);
}());