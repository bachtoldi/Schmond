(function () {
	'use strict';

	var app = angular.module('Schmond');

	app.factory('raceService', ['$http', '$q', '$location', 'ngAuthSettings', function ($http, $q, $location, ngAuthSettings) {
		var factory = {};

		function getRaces() {
			var deferred = $q.defer();

			$http.get('/api/races').success(function (response) {
				deferred.resolve(response);
			}).error(function (err) {
				deferred.reject(err);
			});

			return deferred.promise;
		}

		factory.getRaces = getRaces;

		return factory;
	}]);
}());