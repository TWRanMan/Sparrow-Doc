var demoApp = angular.module('webappMainApp/demo', [
    'ngRoute'
]);


demoApp.config(function ($routeProvider) {
    $routeProvider
        .when('/demo', {
            templateUrl: 'plugin/demo/views/demo.html',
            controller: 'DemoCtrl'
        });
});