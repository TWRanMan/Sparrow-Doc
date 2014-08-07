'use strict';

/**
 * @ngdoc function
 * @name webappMainApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the webappMainApp
 */
angular.module('webappMainApp')
  .controller('MainCtrl', function ($scope) {
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];
  });
