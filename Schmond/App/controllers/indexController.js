﻿(function() {
    'use strict';

    var app = angular.module('schmond.controllers', []);

    app.controller('indexController', ['$scope', '$rootScope', '$http', '$location', 'authService', function ($scope, $rootScope, $http, $location, authService) {
            $rootScope.modalMessage = '';
            $rootScope.modalHeader = '';
            $rootScope.modalLink = '#!';
            this.footerLinks = [
            {
                text: 'Impressum',
                url: '/imprint'
            }];
            this.authentication = authService.authentication;

            $scope.logOut = function() {
                authService.logOut();
                $location.path('/login');
            }

            $scope.isActive = function(viewLocation) {
                return $location.path().indexOf(viewLocation) > -1;
            };

            $scope.getDateNow = function() {
                return new Date();
            };
        }
    ]);
}());