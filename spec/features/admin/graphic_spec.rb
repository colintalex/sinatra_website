require 'spec_helper'

RSpec.describe "As a registered admin" do
  it "I can create a graphic" do
    visit '/admin'

    click_on 'New Graphic'

    fill_in :date, with: '03/06/2005'
    fill_in :description, with: 'description'
    fill_in :image, with: 'image'
    fill_in :work_hours, with: 4

    click_on 'Submit'

    graphic = Graphic.first
    expect(current_path).to eql('/admin')
    expect(Graphic.all.count).to eql(1)
    expect(graphic.date).to eql('03/06/2005')
    expect(graphic.description).to eql('description')
    expect(graphic.image).to eql('image')
    expect(graphic.work_hours).to eql(4)
  end

  it "I can edit and update a graphic" do
    graphic = Graphic.create(date: 'Title',
             description: 'description',
                   image: 'image',
              work_hours: 4)

    visit '/admin'

    within '.graphic-list' do
      click_on 'Edit Graphic'
    end

    fill_in :date, with: 'New 03/06/2005'
    fill_in :description, with: 'New description'
    click_on 'Submit'

    expect(current_path).to eql('/admin')
    graphic = Graphic.last
    expect(graphic.date).to eql('New 03/06/2005')
    expect(graphic.description).to eql('New description')
  end

  it "I can delete a graphic" do
    graphic = Graphic.create(date: '03/06/2005',
             description: 'description',
                   image: 'image',
              work_hours: 4)

    visit '/admin'

    within '.graphic-list' do
      click_on 'Delete Graphic'
    end

    expect(current_path).to eql('/admin')
  end
end
