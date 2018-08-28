class CreateExchangeCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :exchange_codes do |t|
      t.column :code_from, "char(3)"
      t.column :code_to, "char(3)"

      t.timestamps
    end
  end
end
