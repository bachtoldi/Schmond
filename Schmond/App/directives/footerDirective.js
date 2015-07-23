(function () {
    var app = angular.module('schmond.directives', []);

    app.directive('schmondFooter', function () {
        return {
            restrict: 'E',
            templateUrl: 'app/views/shared/footer.html',
            scope: {
                links: '@'
            }
        };
    });
}());