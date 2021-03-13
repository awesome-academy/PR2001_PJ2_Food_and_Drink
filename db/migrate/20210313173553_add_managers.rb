class AddManagers < ActiveRecord::Migration[6.0]
  def change
    add_column :managers, :confirmation_token, :string
    add_column :managers, :confirmed_at, :datetime
    add_column :managers, :confirmation_sent_at, :datetime
    add_column :managers, :unconfirmed_email, :string
    add_index :managers, :confirmation_token, unique: true
  end
end
