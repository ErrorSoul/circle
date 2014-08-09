require 'spec_helper'
require 'pry'




describe SessionsController do 
  let!(:user) { FactoryGirl.create(:user) }
  
  


  
  describe "POST create" do 
    
    context "with valid params" do
      it "an user is created and returned" do
        
        post :create, user: FactoryGirl.attributes_for(:user)
        #pry.binding
        user.reload
        #x = User.find_by(email: user[:email])
        expected_json = { user: user, authorized: 'true' }.to_json
        expect(response.body).to eq expected_json
      end
    end
    
    context "with invalid params" do
      
      it "invalid password" do
        post :create, user: FactoryGirl.attributes_for(:invalid_user_password)
        expected_json = { authorized: "false" }.to_json
        expect(response.body).to eq expected_json
      end

      it "invalid email" do
        post :create, user: FactoryGirl.attributes_for(:invalid_user_email)
        expected_json = { authorized: "false" }.to_json
        expect(response.body).to eq expected_json
      end
    end
  end



  describe "DELETE destroy" do
    before (:each) do
      post :create, user: FactoryGirl.attributes_for(:user)
    end
      

    
    it "return false status of authorized" do 
      #pry.binding
      delete :destroy, id: 1 
      expected_json = { authorized: "false" }.to_json
            expect(response.body).to eq expected_json
    end
    
    it "destroys the sessions" do
      delete :destroy, id: 1
      expect(cookies[:remember_token]).to be_nil
    end
  end
end
