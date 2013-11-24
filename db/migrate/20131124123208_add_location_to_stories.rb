class AddLocationToStories < ActiveRecord::Migration
  def change
    add_column :stories, :city, :string
    add_column :stories, :state, :string
  end
end
