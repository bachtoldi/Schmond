(function () {
	'use strict';

	var app = angular.module('md-elements', []);

	app.directive('mdFooter', function () {
		function linkFunc(scope) {
			scope.dateNow = new Date();
		}

		var directive = {
			restrict: 'E',
			templateUrl: 'app/views/shared/footer.html',
			link: linkFunc,
			transclude: true,
			scope: {
				copyright: '@mdCopyright',
				since: '@mdSince',
				version: '@mdVersion'
			}
		};

		return directive;
	});
}());