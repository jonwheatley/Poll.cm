class AddViewsToQuestions < ActiveRecord::Migration
  def self.up
    add_column :questions, :views, :integer
  end

  def self.down
    remove_column :questions, :views
  end
end
