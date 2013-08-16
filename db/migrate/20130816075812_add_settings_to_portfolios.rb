class AddSettingsToPortfolios < ActiveRecord::Migration
  def change
  	add_column :portfolios, :brokerage, :decimal
  	add_column :portfolios, :taxslipage, :decimal
  	add_column :portfolios, :totalextraround, :decimal
  	add_column :portfolios, :mriskstock, :decimal
  	add_column :portfolios, :mriskcapital, :decimal
  	add_column :portfolios, :mcats, :decimal
  end
end
