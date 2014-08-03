


describe "Login Controller", ->
  describe " Log cont", ->
    beforeEach module('admin')
    ctrl  = {}
    scope = {}
    beforeEach(inject((_$httpBackend_, $rootScope, $controller, sessionStorage) ->
      $httpBackend = _$httpBackend_
      $httpBackend.expectPOST('/sessions').respond([{authorized: 'true'}])
      scope = $rootScope.$new()
      service = sessionStorage
      ctrl = $controller('loginCtrl', $scope: scope )
      
      ))
    describe "llflflfl", ->
      it "ffjfkfjf", ->
        expect(scope.email).toBeDefined()
  
      
