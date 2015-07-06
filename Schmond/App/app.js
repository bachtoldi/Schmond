var app = angular.module('Schmond', ['ngRoute', 'LocalStorageModule']);

app.config(function ($routeProvider) {
	$routeProvider.when('/login', {
		controller: 'accountController',
		templateUrl: '/app/views/account/login.html'
	});
	$routeProvider.when('/register', {
		controller: 'accountController',
		templateUrl: '/app/views/account/register.html'
	});

	$routeProvider.otherwise('/login');
});

app.constant('ngAuthSettings', {
	apiServiceBaseUri: '/',
	clientId: 'Schmond'
});

app.config(function ($httpProvider) {
	$httpProvider.interceptors.push('authInterceptorService');
});

app.run(['authService', function (authService) {
	authService.fillAuthData();
}]);
