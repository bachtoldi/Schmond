(function () {
	var app = angular.module('md-elements', []);


	app.directive('mdFooter', function () {
		function linkFunc(scope) {
			scope.dateNow = new Date();
		}

		var directive = {
			restrict: 'E',
			templateUrl: 'app/views/shared/footer.html',
			link: linkFunc,
			scope: {
				links: '=mdLinks',
				copyright: '@mdCopyright',
				since: '@mdSince',
				version: '@mdVersion'
			}
		};

		return directive;
	});
}());