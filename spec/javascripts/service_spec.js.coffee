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


  it "check inject", ->
    console.log("SERVICE", @service)
    expect(@service).toBeDefined()
    

  describe "SessionStorage getter/setter ", ->
    describe "getUser", ->
      it "no user", ->
        null_user = @service.getUser()
        expect(null_user).toBeNull()

      describe "have user", ->
        beforeEach ->
          
          @service._user = @user
          @current_user = @service.getUser()
          console.log(@service._user,"USER_BEFORE")

        afterEach ->
          @service._user = null
          console.log(@service._user, "USER_AFTER")

      
      
        it "user is equal", ->
          
          expect(@current_user).toBe(@user)
    describe "setUser", ->
      beforeEach ->
        @service._user = null
        @service.setUser(@user)


      it "pass user ", ->
          expect(@service.getUser()).toBe(@user)

      it "second set user", ->
          @service.setUser(null)
          expect(@service.getUser()).toBeNull()

       
      describe "user attributes", ->
        it "user.id", ->
            user = @service.getUser()
            expect(user.id).toBeDefined()
            expect(user.id).toBe(10)

    
