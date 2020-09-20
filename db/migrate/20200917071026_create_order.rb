class CreateOrder < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :address
      t.integer :phone_number
      t.integer :payment
      t.integer :save_price_to_order
      t.references(:user, null: false, type: :bigint)
      t.references(:cart, null: false, type: :bigint)
      t.timestamps
    end
  end
end