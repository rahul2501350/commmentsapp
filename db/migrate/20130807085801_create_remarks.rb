class CreateRemarks < ActiveRecord::Migration
  def change
    create_table :remarks do |t|
      t.datetime :date
      t.decimal :op
      t.decimal :cp
      t.decimal :day_profit
      t.string :remark
      t.integer :trade_id

      t.timestamps
    end
  end
end
