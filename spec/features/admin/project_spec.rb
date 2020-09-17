require 'spec_helper'

RSpec.describe "As a registered admin" do
  it "I can create a project" do
    visit '/admin'

    click_on 'New Project'

    fill_in :title, with: 'Title'
    fill_in :description, with: 'description'
    # fill_in :image, with: 'image'
    fill_in :github_url, with: 'ghlink'
    fill_in :deploy_url, with: 'deploy_link'

    click_on 'Submit'

    proj = Project.first
    expect(current_path).to eql('/admin')
    expect(Project.all.count).to eql(1)
    expect(proj.title).to eql('Title')
    expect(proj.description).to eql('description')
    # expect(proj.image).to eql('image')
    expect(proj.github_url).to eql('ghlink')
    expect(proj.deploy_url).to eql('deploy_link')
  end

  it "I can edit and update a project" do
    project = Project.create(title: 'Title',
             description: 'description',
                   image: 'image',
              github_url: 'ghlink',
              deploy_url: 'deploy_link')

    visit '/admin'

    within '.project-list' do
      click_on 'Edit Project'
    end
    
    fill_in :title, with: 'New Title'
    fill_in :description, with: 'New description'
    click_on 'Submit'

    expect(current_path).to eql('/admin')
    proj = Project.last
    expect(proj.title).to eql('New Title')
    expect(proj.description).to eql('New description')
  end

  it "I can delete a project" do
    project = Project.create(title: 'Title',
             description: 'description',
                   image: 'image',
              github_url: 'ghlink',
              deploy_url: 'deploy_link')

    visit '/admin'

    within '.project-list' do
      click_on 'Delete Project'
    end

    expect(current_path).to eql('/admin')
  end
end
