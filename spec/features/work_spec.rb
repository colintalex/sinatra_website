require 'spec_helper'

RSpec.describe "As a visitor" do
  describe "I can view the page properly" do
    it "displays the nav bar" do
      visit '/work'

      page.has_link?('Home')
      page.has_link?('Work')
      page.has_link?('About Me')
      page.has_link?('Contact')
    end

    it "displays the tabs for work" do
      visit '/work'

      within '#myTab' do
        expect(page).to have_content('Code Projects')
        expect(page).to have_content('Graphic Design')
      end
    end
  end
end
