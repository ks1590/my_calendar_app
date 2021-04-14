class AddAmounttoEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :amount, :float
    add_column :events, :note, :string
  end
end
