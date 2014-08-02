describe "Restauranteur controllers", ->
  beforeEach module("admin")

  describe "loginCtrl", ->
    it "should set restaurants to an empty array", inject(($controller) ->
      scope = {}
      ctrl = $controller("loginCtrl",
        $scope: scope
      )
      expect(scope.email.length).toBe 5
    )
