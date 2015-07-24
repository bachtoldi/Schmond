(function () {
	'use strict';

	app.controller('instanceController', ['$scope', '$rootScope', '$http', 'instanceService', function ($scope, $rootScope, $http, instanceService) {

		var vm = this;

		instanceService.getInstances().then(function (response) {
			vm.instances = response;
		});
	}]);
}());