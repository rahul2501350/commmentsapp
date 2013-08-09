class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :name
      t.decimal :quote
      t.decimal :lastp

      t.timestamps
    end
  end
end
