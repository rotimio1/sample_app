require 'spec_helper'
describe "Static pages" do
subject { page }
shared_examples_for "all static pages" do
it { should have_selector('h1',
text: heading) }
it { should have_selector('title', text: full_title(page_title)) }
end
end
describe "Home page" do
before { visit root_path }
let(:heading)
{ 'Sample App' }
let(:page_title) { '' }
it_should_behave_like "all static pages"
it { should_not have_selector 'title', text: '| Home' }
end
end
describe "Help page" do
before { visit root_path }
let(:heading) {'Help'}
let(:page_title) { '' }
it_should_behave_like "all static pages"
end
end
describe "About page" do
before { visit root_path }
let(:heading) {'About'}
let(:page_title) { '' }
end
end
describe "Contact page" do
before { visit root_path }
let(:heading) {'Contact'}
let(:page_title) { '' }
it_should_behave_like "all static pages"
end
end
end