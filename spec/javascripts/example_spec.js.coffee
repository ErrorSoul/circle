


describe "Login Controller", ->
  describe " Log cont", ->
    beforeEach module('admin')
    #ctrl  = {}
    #scope = {}
    beforeEach(inject(($injector, _$httpBackend_, _$cookieStore_, _$location_, $rootScope, $controller) ->
      @$httpBackend = _$httpBackend_
      @location = _$location_
      @r = $rootScope
      @cookie = _$cookieStore_
      @scope = $rootScope.$new()
      @service = $injector.get("sessionStorage")
      @ctrl = $controller('loginCtrl', $scope: @scope)
      `$rootScope.$on('$routeChangeStart', function(event, current, last) {
        console.log('change');
          })`
      
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
        
        #spyOn(@location, "path").andReturn("/login")
          
        @cookie.put('token', false)
        console.log(@cookie.get('token'), "token")
        console.log(!!@cookie.get('token'), "token!!")
        @$httpBackend.expectPOST('/sessions', user: @bad_email).respond({authorized: 'false'})
        #because mock location can't read path properly
        # location.path equal '' ;('/' in html5mode)
        @location.path('/login')
        
        @scope.login(@bad_email)
        @r.$digest()
        @$httpBackend.flush()
        expect(@service.authorized()).toBe(false)
        expect(@service.getUser()).toBeNull()
        #expect(@location.path).toHaveBeenCalled()
        expect(@location.path()).toEqual('/login')
        expect(@scope.message).toEqual("Invalid login or password")

      it "with correct user", ->
        spyOn(@location, "path")
        
        @$httpBackend.expectPOST('/sessions', user: @user).respond({user: @user, authorized: 'true'})
        @scope.login(@user)
        @r.$digest()
        @$httpBackend.flush()
        expect(@service.authorized()).toBe(true)
        expect(@service.getUser()).toEqual(@set_user)
        expect(@location.path).toHaveBeenCalledWith("/dashboard")
        
      
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
