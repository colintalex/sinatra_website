require 'spec_helper'

RSpec.describe "As a registered admin" do

  it "I can view the admin dashboard" do

    visit '/admin'
    expect(current_path).to eql('/admin')
    expect(page).to have_content('dashboard')
  end
end
