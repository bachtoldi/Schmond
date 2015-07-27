(function () {
	'use strict';

	var app = angular.module('Schmond');

	app.factory('needTypeService', ['$http', '$q', function ($http, $q) {
		var factory = {};

		var getNeedTypes = function () {
			var deferred = $q.defer();

			$http.get('/api/needtypes').success(function (response) {
				deferred.resolve(response);
			}).error(function (err) {
				deferred.reject(err);
			});

			return deferred.promise;
		}

		factory.getNeedTypes = getNeedTypes;

		return factory;
	}]);
}());