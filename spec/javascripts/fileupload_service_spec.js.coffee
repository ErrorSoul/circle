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
    @new_post = ({title: "New title", text: "new text"})
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

    it "update post", ->
   
      @service.uploadFileToUrl(@post_1, @callback)
      @$httpBackend.flush()
      expect(@obj.message).toEqual('ok')


  describe "createPost", ->
    beforeEach ->
      @callback = (data) =>
        @obj.message = data.message
      @$httpBackend.expectPOST("/posts", @service.createFormData(@new_post)).respond({message: "ok"})

    it 'create post', ->
      @service.createPost(@new_post, @callback)
      @$httpBackend.flush()
      expect(@obj.message).toEqual('ok')
      
        
        
