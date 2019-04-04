class ChangeTypesMistake < ActiveRecord::Migration[5.2]
  def change
    change_column :purchases, :quantity, :integer
    change_column :purchases, :cost, :float
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
