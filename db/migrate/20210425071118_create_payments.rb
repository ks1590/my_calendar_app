class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :name
      t.timestamps
    end
    add_reference :events, :payment
  end
end
