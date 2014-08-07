'use strict';

/**
 * @ngdoc function
 * @name webappMainApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the webappMainApp
 */
angular.module('webappMainApp')
  .controller('AboutCtrl', function ($scope) {
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];
  });
