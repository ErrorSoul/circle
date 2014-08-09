
describe "DashboardCtrl", ->
  beforeEach module("admin")
  beforeEach(inject(($injector,_$httpBackend_, $rootScope, $controller) ->
    @$httpBackend = _$httpBackend_
    @r  = $rootScope
    @scope = $rootScope.$new()
    @ctrl = $controller('DashboardCtrl', $scope: @scope)
    @post = $injector.get("Post")
    @posts = ({title: "Title #{n}", text: "Text #{n}"} for n in [1..4])
    ))

  afterEach ->
      @service = undefined
      @$httpBackend.verifyNoOutstandingExpectation()
      @$httpBackend.verifyNoOutstandingRequest()

  describe "Post", ->
      describe "query method ", ->
       
          
        it "should return posts", ->
          @$httpBackend.expectGET('/posts').respond({posts: @posts})
          @$httpBackend.flush()
          expect(@scope.posts).toEqual(@posts)
          

          
          
  
