class AddAddressToContacts < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :address, :string
  end
end
