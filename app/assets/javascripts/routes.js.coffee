
admin = angular.module( 'admin',['ngRoute'])
 
admin.controller 'loginCtrl',["$scope",($scope) ->
        $scope.foo = foo
        
  
]


admin.config [
  '$routeProvider'
  
  ($routeProvider, $locationProvider) ->
    $routeProvider
    .when '/'    ,
      templateUrl: '/assets/login.html',
      controller: 'loginCtrl'



]
