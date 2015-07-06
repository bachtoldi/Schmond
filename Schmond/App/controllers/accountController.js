'use strict';
app.controller('accountController', ['$scope', '$rootScope', '$http', '$location', '$timeout', function ($scope, $rootScope, $http, $location, $timeout) {

	var redirect = function (path) {
		var timer = $timeout(function () {
			$timeout.cancel(timer);
			$rootScope.successMessage = '';
			$location.path(path);
		}, 5000);
	};

	$scope.initRegister = function () {
		$rootScope.title = 'Registrieren';
	}

	$scope.register = function () {
		$rootScope.loading = true;
		$http.post('/api/accounts', $scope.user).success(function () {
			$rootScope.successMessage = 'Registrierung erfolgreich abgeschlossen! In 5 Sekunden werden Sie zur Anmeldung weitergeleitet.';
			redirect('/login');
		}).error(function (err) {
			console.log(err);
			$rootScope.message = err;
		});

		$rootScope.loading = false;
	}
}]);