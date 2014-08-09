admin = angular.module('admin');

admin.controller("LocationController", function($scope, $location) {
  $scope.$location = {};
  angular.forEach("protocol host port path search hash".split(" "), function(method){
    $scope.$location[method] = function(){
      var result = $location[method].call($location);
      return angular.isObject(result) ? angular.toJson(result) : result;
    };
  });
})

