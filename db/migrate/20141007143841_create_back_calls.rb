class CreateBackCalls < ActiveRecord::Migration
  def change
    create_table :back_calls do |t|
      t.string :phone
      t.boolean :answered
      t.string :comment

      t.timestamps
    end
  end
end
