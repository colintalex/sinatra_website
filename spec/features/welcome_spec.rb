require 'spec_helper'

RSpec.describe "As a guest" do
  describe "I can view the welcome page correctly" do
    it "shows the nav bar" do
      visit '/'
      expect(page).to have_content('Colin Alexander')
      page.has_link?('Home')
      page.has_link?('Work')
      page.has_link?('About Me')
      page.has_link?('Contact')
    end

    it "shows the background image" do
      visit '/'

      page.has_css?('welcome-page')
    end
  end

  describe "I can navigate properly" do
    it "The Home link works " do
      visit '/'
      click_on 'Home'

      expect(current_path).to eql('/')
    end

    it "The My Work link works " do
      visit '/'
      within '.navbar-nav' do
        click_on 'My Work'
      end

      expect(current_path).to eql('/work')
    end

    it "The About Me link works " do
      visit '/'
      within '.navbar-nav' do
        click_on 'About Me'
      end

      expect(current_path).to eql('/about')
    end

    it "The Contact link works " do
      visit '/'
      click_on 'Contact'

      expect(current_path).to eql('/contact')
    end
  end
end
