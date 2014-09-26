class CreateCarousels < ActiveRecord::Migration
  def change
    create_table :carousels do |t|
      t.string :header
      t.string :content_text
      t.boolean :main, default: false

      t.timestamps
    end
  end
end
