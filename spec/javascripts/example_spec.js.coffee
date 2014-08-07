


describe "Login Controller", ->
  describe " Log cont", ->
    beforeEach module('admin')
    #ctrl  = {}
    #scope = {}
    beforeEach(inject(($injector, _$httpBackend_, _$location_, $rootScope, $controller) ->
      @$httpBackend = _$httpBackend_
      @location = _$location_
      @scope = $rootScope.$new()
      @service = $injector.get("sessionStorage")
      console.log(@service, "SERVICE")
      console.log(@service.authorized(), "AUTHSERVICE")
      @ctrl = $controller('loginCtrl', $scope: @scope)
      @user =
               email: "bruce2000@mail.ru"
               id: 11
               
               name: "Bruce"
      @set_user =
                id: @user.id
                name: @user.name
      @bad_email =
                email: "bad_email"
                name: "Joseph"
      
      ))

    afterEach ->
      @service = undefined
      @$httpBackend.verifyNoOutstandingExpectation()
      @$httpBackend.verifyNoOutstandingRequest()

    describe "login method", ->
      it "with bad user ", ->
        
        @$httpBackend.expectPOST('/sessions', user: @bad_email).respond({authorized: 'false'})
        @scope.login(@bad_email)
        @$httpBackend.flush()
        expect(@service.authorized()).toBe(false)
        expect(@service.getUser()).toEqual({})
        expect(@location.path()).toEqual('/login')
        expect(@scope.message).toEqual("Invalid login or password")

      it "with correct user", ->
        
        @$httpBackend.expectPOST('/sessions', user: @user).respond({user: @user, authorized: 'true'})
        @scope.login(@user)
        @$httpBackend.flush()
        expect(@service.authorized()).toBe(true)
        expect(@service.getUser()).toEqual(@set_user)
        expect(@location.path()).toEqual('/dashboard') 
      
    ###

    
    describe "loginRequestHandler", ->
        
      it "should redirect to dashboard", ->
        spyOn(@service, "authorized").andReturn(true)
        @scope.loginRequestHandler("example")
        expect(@service.authorized).toHaveBeenCalled()
        expect(@location.path()).toEqual("/dashboard")

      it "stay here with warning message", ->
        spyOn(@service, "authorized").andReturn(false)
        @scope.loginRequestHandler("example")
        expect(@service.authorized).toHaveBeenCalled()
        expect(@location.path()).toEqual('/')
        expect(@scope.message).toEqual("Invalid login or password")



    describe "loginErrorHandler", ->
      it 'error message', ->
        
        @scope.loginErrorHandler("ERROR")
        expect(@scope.message).toEqual("Error ERROR") ###
