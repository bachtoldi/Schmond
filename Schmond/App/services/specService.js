(function () {
	'use strict';

	var app = angular.module('Schmond');

	app.factory('specService', ['$http', '$q', function ($http, $q) {
		var factory = {};

		function getSpecsByClass(classId) {
			var deferred = $q.defer();

			$http.get('/api/specs?classId=' + classId).success(function (response) {
				deferred.resolve(response);
			}).error(function (err) {
				deferred.reject(err);
			});

			return deferred.promise;
		}

		factory.getSpecsByClass = getSpecsByClass;

		return factory;
	}]);
}());