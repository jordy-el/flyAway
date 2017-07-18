class AddEmailToBills < ActiveRecord::Migration[5.1]
  def change
    add_column :bills, :email, :string
  end
end
