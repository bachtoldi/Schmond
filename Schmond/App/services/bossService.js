(function () {
	'use strict';

	var app = angular.module('Schmond');

	app.factory('bossService', ['$http', '$q', function ($http, $q) {
		var factory = {};

		var getBossesByInstance = function (instanceId) {
			var deferred = $q.defer();

			$http.get('/api/bosses?instanceId=' + instanceId).success(function (response) {
				deferred.resolve(response);
			}).error(function (err) {
				deferred.reject(err);
			});

			return deferred.promise;
		}

		var getBossById = function (id) {
			var deferred = $q.defer();

			$http.get('/api/bosses/' + id).success(function (response) {
				deferred.resolve(response);
			}).error(function (err) {
				deferred.reject(err);
			});

			return deferred.promise;
		}

		factory.getBossesByInstance = getBossesByInstance;
		factory.getBossById = getBossById;

		return factory;
	}]);
}());