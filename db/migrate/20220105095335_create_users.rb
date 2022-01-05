class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users, id: :uuid do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.integer :total_orders_pln, null: false, default: 0
      t.integer :total_orders_eur, null: false, default: 0

      t.timestamps
    end
  end
end
