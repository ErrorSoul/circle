
describe('Foo', function() {
  it("does something", function() {
    expect(1 + 1).toBe(2);
  });
});





describe('templates', function() {
    beforeEach(function() {
      browser().navigateTo('/');
	
    });

    it('fffff', function(){
	expect(element('div').html()).toContain('6');
    });


});
