(function () {
	'use strict';

	var app = angular.module('Schmond');

	app.factory('classService', ['$http', '$q', function ($http, $q) {
		var factory = {};

		function getClassesByRace(raceId) {
			var deferred = $q.defer();

			$http.get('/api/classes?raceId=' + raceId).success(function (response) {
				deferred.resolve(response);
			}).error(function (err) {
				deferred.reject(err);
			});

			return deferred.promise;
		}

		factory.getClassesByRace = getClassesByRace;

		return factory;
	}]);
}());