
describe "DashboardCtrl", ->
  beforeEach module("admin")
  beforeEach(inject(($injector,_$httpBackend_, $rootScope, $controller,sessionStorage,$location, $cookieStore) ->
    @$httpBackend = _$httpBackend_
    @r  = $rootScope
    
    @scope = $rootScope.$new()
    @Post = $injector.get("Post")
    @ctrl = $controller('DashboardCtrl', $scope: @scope, Post: @Post)
    @location = $location
   
    
    
  
    
    @service = $injector.get("sessionStorage")
    
      
    @user = {id: 1, name: "Oleg"}
   
    
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

      describe "delete method", ->

     
        it "should delete post", ->
          
          
  
 


          
          @$httpBackend.expectGET('/posts').respond({message: "Your post deleted"})
          @$httpBackend.expectDELETE('/posts/1').respond({message: "Your post deleted"})
          post = {}
          post.id = 1
          @scope.delete(post)
          
          @r.$digest()
          @$httpBackend.flush()
        
          expect(@scope.message).toEqual("Your post deleted")
          
          
          

          
          
  
