(function () {
	'use strict';

	var app = angular.module('Schmond');

	app.factory('itemService', ['$http', '$q', function ($http, $q) {
		var factory = {};

		var getItemsForBoss = function (bossId) {
			var deferred = $q.defer();

			$http.get('/api/items?bossId=' + bossId).success(function (response) {
				deferred.resolve(response);
			}).error(function (err) {
				deferred.reject(err);
			});

			return deferred.promise;
		}

		factory.getItemsForBoss = getItemsForBoss;

		return factory;
	}]);
}());