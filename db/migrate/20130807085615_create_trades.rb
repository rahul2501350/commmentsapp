class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.string :stock
      t.decimal :qty
      t.decimal :buy_price
      t.datetime :buy_date
      t.decimal :bepoint
      t.integer :portfolio_id

      t.timestamps
    end
  end
end
