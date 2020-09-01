class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.string :image
      t.string :github_url
      t.string :deploy_url
      t.timestamps null: false
    end
  end
end
