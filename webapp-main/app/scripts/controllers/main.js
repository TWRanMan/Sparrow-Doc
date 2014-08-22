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
        $scope.template = "this is value";
        $scope.vars ={
            a:{value:"a"},
            b:{value:"b"},
            c:{value:"c"}
        }
  });
