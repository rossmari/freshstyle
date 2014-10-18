class UpdateBackCall < ActiveRecord::Migration
  def up
    change_column :back_calls, :comment, :text
    change_column :back_calls, :answered, :boolean, default: false, null: false
  end
end
