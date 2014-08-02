require 'spec_helper'

 describe "index" do 
  it "gggg" do
    
   
    visit '/'
    expect(page).not_to have_title('Circle')
  end  
end

 
