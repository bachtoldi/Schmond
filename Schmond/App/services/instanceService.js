(function () {
	'use strict';

	var app = angular.module('Schmond');

	app.factory('instanceService', ['$http', '$q', '$rootScope', '$location', 'ngAuthSettings', function ($http, $q, $rootScope, $location, ngAuthSettings) {
		var factory = {};

		var getInstances = function () {
			var deferred = $q.defer();

			$http.get('/api/instances').success(function (response) {
				deferred.resolve(response);
			}).error(function (err) {
				deferred.reject(err);
			});

			return deferred.promise;
		}

		var getInstanceById = function (id) {
			var deferred = $q.defer();

			$http.get('/api/instances/' + id).success(function (response) {
				deferred.resolve(response);
			}).error(function (err) {
				deferred.reject(err);
			});

			return deferred.promise;
		}

		factory.getInstances = getInstances;
		factory.getInstanceById = getInstanceById;

		return factory;
	}]);
}());