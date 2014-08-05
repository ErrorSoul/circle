describe "sessionStorage test", ->
  beforeEach module("admin")
  beforeEach inject ($injector, $httpBackend ) ->
    
    @service = $injector.get("sessionStorage")
  
    console.log("FFFserv", @service)
  
  
  
    @httpB  = $httpBackend
    @user =
            id: 10
            name: "John"
            email: "john@mail.ru"
          
            remember_token: "thomas"

    @set_user =
               id: @user.id
               name: @user.name
    @bad_user = {}


  afterEach ->
    @service = undefined
    @httpB.verifyNoOutstandingExpectation()
    @httpB.verifyNoOutstandingRequest()





  it "check inject", ->
    console.log("SERVICE", @service)
    expect(@service).toBeDefined()

  it "check authorized", ->
    expect(@service.authorized()).toBe(false)

  describe "sessionStorage LOGIN|LOGOUT methods", ->
    beforeEach ->

      u = @service.updateUser
      @callback = (data) ->
        console.log(data, "DDDDDDDDDDDDAAAAAAAAT")
        u(data.user, data.authorized)

    it "login and authentication", ->
      @httpB.expectPOST("/sessions", user: @user).respond(
        200,
        user: @user,
        authorized: "true")
      @service.login(@user, @callback)
      @httpB.flush()
      expect(@service.authorized()).toBe(true)
      expect(@service.getUser()).toEqual(@set_user)
  
    it "login and bad authentication", ->
      @httpB.expectPOST("/sessions", user: @bad_user).respond(
        
        authorized: "false")
      @service.login(@bad_user, @callback)
      @httpB.flush()
      expect(@service.authorized()).toBe(false)
      expect(@service.getUser()).toEqual(@bad_user)


    describe "logout", ->
      beforeEach ->
        @httpB.expectDELETE("/sessions").respond(

        
          authorized: "false")
    
        
      it "after login", ->
    
        @service.updateUser(@user, "true")
        @service.logout(@callback)
        @httpB.flush()
        console.log(@service.getUser(), "USERRRR")
        expect(@service.authorized()).toBe(false)
        expect(@service.getUser()).toEqual(@bad_user)

      it "without login", ->
        
        @service.logout(@callback)
        @httpB.flush()
        expect(@service.authorized()).toBe(false)
        expect(@service.getUser()).toEqual(@bad_user)

      
    
      
      

  describe "sessionStorage updateUser", ->
    it "authorized", ->
      @service.updateUser(@user, "true")
      expect(@service.getUser()).toEqual(@set_user)
      expect(@service.authorized()).toBe(true)

    it "no authorized", ->
      @service.updateUser(@user, "false")
      expect(@service.getUser()).toEqual({})
      expect(@service.authorized()).toBe(false)

    it "authorized with null user", ->
      @service.updateUser(null, "false")
      expect(@service.getUser()).toEqual({})
      expect(@service.authorized()).toBe(false)

  describe "sessionStorage getter/setter ", ->
    describe "getUser", ->
      it "no user", ->
        console.log(@service, "SSSSSS")
      
        null_user = @service.getUser()
        console.log(null_user, "NULL_USER")
        expect(null_user).toEqual({})

      describe "have user", ->
        beforeEach ->
          
          @service._user = @user
          @current_user = @service.getUser()
          

        afterEach ->
          @service._user = {}
          

      
      
        it "user is equal", ->
          expect(@current_user).toBe(@user)

    describe "setUser", ->
      beforeEach ->
        @service._user = {}
        @service.setUser(@user)
        


      it "pass user ", ->
          expect(@service.getUser()).toEqual(@set_user)

      it "second set user", ->
          @service.setUser({})
          expect(@service.getUser()).toEqual({})

       
      describe "user attributes", ->
        it "user set correct", ->
          u = @service.getUser()
          expect(u).toEqual(@set_user)
      

    
