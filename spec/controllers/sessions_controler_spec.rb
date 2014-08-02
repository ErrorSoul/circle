require 'spec_helper'

describe SessionsController do 
  let!(:user) { FactoryGirl.create(:user) }


  
  describe "POST create" do 
    context "with valid params" do
      it "an user is created and returned" do
       post :create, user: FactoryGirl.attributes_for(:user)
        expected_json = { authorized: 'true'}.to_json
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
end
