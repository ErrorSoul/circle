describe "PostDetailCtrl", ->
  beforeEach module('admin')
  beforeEach(inject(($injector, _$httpBackend_, $rootScope, $controller, $routeParams) ->
    @$httpBackend = _$httpBackend_
    $routeParams.id = '1'
    @scope = $rootScope.$new()
    @ctrl = $controller('PostDetailCtrl', $scope: @scope)
    @post = $injector.get("Post")
    @post_1 = ({title: "Title 1", text: "Text 1"})
    ))

  afterEach ->
      @service = undefined
      @$httpBackend.verifyNoOutstandingExpectation()
      @$httpBackend.verifyNoOutstandingRequest()



  describe "post # 1", ->
    describe "find method", ->
      it "should return post with id = 1", ->
        @$httpBackend.expectGET('/posts/1/edit').respond({ post: @post_1})
        @$httpBackend.flush()
        expect(@scope.post).toEqual(@post_1)
