class ChangePreminumDefaultOnUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :premium, :boolean, :default => false

  end
end
