

var admin = angular.module('admin',['ngRoute']);
 
admin.controller('loginCtrl', function ($scope) {
  $scope.foo = 'foo';
  $scope.phones = [
    {'name': 'Nexus S',
     'snippet': 'Fast just got faster with Nexus S.'},
    {'name': 'Motorola XOOM™ with Wi-Fi',
     'snippet': 'The Next, Next Generation tablet.'},
    {'name': 'MOTOROLA XOOM™',
     'snippet': 'The Next, Next Generation tablet.'}
  ];
});
admin.config(['$routeProvider',
  function($routeProvider) {
    $routeProvider.
      otherwise( {
        templateUrl: 'assets/login.html',
        controller: 'loginCtrl'
      });
  }]);
