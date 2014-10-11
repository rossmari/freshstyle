class AddRowOrderToPages < ActiveRecord::Migration
  def change
    add_column :pages, :row_order, :integer
  end
end
