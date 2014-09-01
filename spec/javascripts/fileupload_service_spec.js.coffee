describe "fileUpload", ->
  beforeEach module('admin')
  beforeEach(inject(($injector, _$httpBackend_, $rootScope, $controller, $routeParams) ->
    @$httpBackend = _$httpBackend_
    $routeParams.id = '1'
  
    
    @obj = {}
    
    @scope = $rootScope.$new()
  
    
    @post = $injector.get("Post")
    @service = $injector.get('fileUpload')
    @post_1 = ({title: "Title 1", text: "Text 1"})
    ))

  afterEach ->
      @service = undefined
      @$httpBackend.verifyNoOutstandingExpectation()
      @$httpBackend.verifyNoOutstandingRequest()



   describe "uploadFileToUrl", ->
    beforeEach ->
      
      
      @callback = (data) =>
         @obj.message = data.message
      @post_1.title = 'New Title'
      
      @$httpBackend.expectPATCH("/posts/1" ).respond({message: "ok"})

    it "login and authentication", ->
   
      @service.uploadFileToUrl(@post_1, @callback)
      @$httpBackend.flush()
      expect(@obj.message).toEqual('ok')
