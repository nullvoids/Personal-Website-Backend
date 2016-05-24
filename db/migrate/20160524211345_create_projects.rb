class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string  :title
      t.text    :description
      t.string  :external_url
      t.string  :repo_url
      t.string  :image_url
      t.integer :order
      t.boolean :hidden
      t.timestamps
    end
  end
end
