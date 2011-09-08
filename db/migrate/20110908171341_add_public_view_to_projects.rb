class AddPublicViewToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :public_view, :boolean, :default => false
  end

  def self.down
    remove_column :projects, :public_view
  end
end