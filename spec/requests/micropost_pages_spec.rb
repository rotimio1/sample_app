require 'spec_helper'

describe "Micropost Pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "micropost creation" do
	before { visit root_path }

    describe "with invalid information" do
     
      it "should not create a micropost" do
		    expect { click_button "Post" }.not_to change(Micropost, :count)
      end

	    describe "error messages" do
		    before { click_button "Post" }
		    it { should have_content('error') }
      end
	  end

	  describe "with valid information" do

	    before { fill_in 'micropost_content', with: "Lorem ipsum" }
	    it "should create a micropost" do
		    expect { click_button "Post" }.to change(Micropost, :count).by(1)
	    end
	  end
  end

  describe "micropost destruction" do
	  before { FactoryGirl.create(:micropost, user: user) }

	  describe "as correct user" do
	    before { visit root_path }
	    it "should delete a micropost" do
	 	    expect { click_link "delete" }.to change(Micropost, :count).by(-1)
	    end
	  end
  end
    
	describe "microposts pagination test" do
  	  let(:user) { FactoryGirl.create(:user) }
     	before do 
    	  visit user_path(user)
    	  31.times { FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum") }
  	  end

  	  after { user.microposts.delete_all }

  	  it { should have_selector('div', class: 'pagination') }

  	  it "should list each micropost" do
      	user.microposts.paginate(page: 1).each do |micropost|
      	  page.should have_selector('span', text: micropost.content)
      end
  	end
	end
end