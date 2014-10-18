class RenameProcessColumn < ActiveRecord::Migration
  def up
    rename_column :back_calls, :answered, :processed
    rename_column :client_messages, :new, :processed
  end

  def down
    rename_column :back_calls, :processed, :answered
    rename_column :client_messages, :processed, :new
  end



end

