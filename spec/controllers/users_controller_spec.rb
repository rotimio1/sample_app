require 'spec_helper'

describe UsersController do

  describe "GET 'show'"	do
	it "should not show delete links for the microposts" do
     mp1 = Factory(:micropost, :user => @user, :content => "Foo bar")
     mp2 = Factory(:micropost, :user => @user, :content => "Joe Ricco")
     get :show, :id => @user
     response.should_not have_selector("a", :content => "delete")
    end

    describe "for signed-in users" do

      it "should show delete links for the microposts" do
        test_sign_in(@user)
        mp1 = Factory(:micropost, :user => @user, :content => "Foo bar")
        mp2 = Factory(:micropost, :user => @user, :content => "Joe Ricco")
        get :show, :id => @user
        response.should have_selector("a", :content => "delete")
      end
    end 

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end
end
