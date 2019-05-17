class AddFieldsToChecks < ActiveRecord::Migration[5.2]
  def change
    add_column :checks, :name, :string
    add_column :checks, :amount, :decimal
    add_column :checks, :date, :date
  end
end
