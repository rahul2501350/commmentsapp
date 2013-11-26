class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.string :fullname
      t.string :sector

      t.timestamps
    end
  end
end
