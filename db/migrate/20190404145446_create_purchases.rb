class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.string :description
      t.string :name
      t.string :email
      t.numeric :cost
      t.numeric :quantity
      t.string :status
      t.string :token
      t.string :idempotency_token
      t.string :payment_url
      t.string :ip_address

      t.timestamps
    end
  end
end
