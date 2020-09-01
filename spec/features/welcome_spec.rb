require 'spec_helper'

RSpec.describe "As a guest" do
  describe "I can view the welcome page correctly" do
    it "shows the nav bar" do
      visit '/'
      expect(page).to have_content('Colin Alexander')
      expect(page).to have_content('Home')
      expect(page).to have_content('Work')
      expect(page).to have_content('About Me')
      expect(page).to have_content('Contact')
    end
  end
end
