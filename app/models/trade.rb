class Trade < ActiveRecord::Base
  attr_accessible :bepoint, :buy_date, :buy_price, :qty, :stock

  has_many :remarks
  belongs_to :portfolio
end
