(function () {
	'use strict';

	var app = angular.module('Schmond');

	app.factory('charService', ['$http', '$q', function ($http, $q) {
		var factory = {};

		var getCharById = function (id) {
			var deferred = $q.defer();

			$http.get('/api/chars/' + id).success(function (response) {
				deferred.resolve(response);
			}).error(function (err) {
				deferred.reject(err);
			});

			return deferred.promise;
		}

		function create(character) {
			var deferred = $q.defer();

			$http.post('/api/chars', character).success(function (response) {
				deferred.resolve(response);
			}).error(function (err) {
				deferred.reject(err);
			});

			return deferred.promise;
		}

		factory.getCharById = getCharById;
		factory.create = create;
		
		return factory;
	}]);
}());