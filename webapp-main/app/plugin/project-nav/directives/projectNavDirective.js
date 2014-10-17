angular.module('webappMainApp/project-nav')
    .directive('projectNav', ['Projects', function(projects) {
        return {
            restrict: 'E',
            templateUrl: 'plugin/project-nav/views/project-nav-tpl.html',
            controller: ['$scope', 'Projects', function(scope, projects) {
                scope.projects = projects;
                scope.selectedProject = projects[0];

                scope.selectProject = function(project) {
                    scope.selectedProject = project;
                }
            }],
            scope: true,
            replace: true,
            link: function() {}
        };
    }]);