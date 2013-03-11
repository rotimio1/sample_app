require 'spec_helper'
describe "Static pages" do
it "should have the right links on the layout" do
visit root_path

click_link "About"
page.should have_selector 'title', text: full_title('About Us')

click_link "Help"
page.should have_selector 'title', text: full_title('Help')

click_link "Contact"
page.should have_selector 'title', text: full_title('contact')

click_link "Sign up now!"
page.should have_selector 'title', text: full_title('sign up')

click_link "sample app"
page.should have_selector 'title', text: full_title('Home')

end

end
