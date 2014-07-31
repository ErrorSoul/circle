
admin = angular.module( 'admin',['ngRoute'])
 
admin.controller 'loginCtrl',["$scope",($scope) ->
        $scope.name = "aaaa"
        $scope.login = (user) ->
                $scope.name = user.name
                $scope.password = user.password
        
  
]


admin.config [
  '$routeProvider'
  
  ($routeProvider, $locationProvider) ->
    $routeProvider
    .when '/'    ,
      templateUrl: '/assets/login.html',
      controller: 'loginCtrl'



]
