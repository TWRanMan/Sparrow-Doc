'use strict';

/**
 * @ngdoc overview
 * @name webappMainApp
 * @description
 * # webappMainApp
 *
 * Main module of the application.
 */
angular
  .module('webappMainApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    'webappMainApp/demo',
    'webappMainApp/projects',
    'webappMainApp/project-nav'
  ])
  .config(function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'views/main.html',
        controller: 'MainCtrl'
      })
      .when('/about', {
        templateUrl: 'views/about.html',
        controller: 'AboutCtrl'
      })
      .otherwise({
        redirectTo: '/'
      });
  });
