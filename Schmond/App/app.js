var app = angular.module('Schmond', ['ngRoute', 'LocalStorageModule', 'checklist-model', 'schmond.controllers', 'md-elements']);

app.config(function ($routeProvider) {
	$routeProvider.when('/login', {
		controller: 'accountController',
		templateUrl: '/app/views/account/login.html'
	});
	$routeProvider.when('/register', {
		controller: 'accountController',
		templateUrl: '/app/views/account/register.html'
	});
	$routeProvider.when('/players', {
		controller: 'charController',
		templateUrl: '/app/views/char/index.html'
	});
	$routeProvider.when('/admin/accounts', {
		controller: 'accountController',
		templateUrl: '/app/views/account/index.html'
	});
	$routeProvider.when('/admin/races', {
		controller: 'raceController',
		templateUrl: '/app/views/race/index.html'
	});
	$routeProvider.when('/admin/classes', {
		controller: 'classController',
		templateUrl: '/app/views/class/index.html'
	});
	$routeProvider.when('/admin/items', {
		controller: 'itemController',
		templateUrl: '/app/views/item/index.html'
	});
	$routeProvider.when('/lootlists/:id', {
		controller: 'lootlistController',
		templateUrl: '/app/views/lootlist/index.html'
	});
	$routeProvider.when('/imprint', {
		controller: '',
		templateUrl: '/app/views/imprint.html'
	});

	$routeProvider.otherwise('/players');
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