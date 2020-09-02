class Project < ActiveRecord::Base
  validates_presence_of :title, uniqueness: true
  validates_presence_of :description
  validates_presence_of :image
  validates_presence_of :github_url

end
