class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.string :name
      t.decimal :capital

      t.timestamps
    end
  end
end
