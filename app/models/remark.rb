class Remark < ActiveRecord::Base
  attr_accessible :cp, :date, :day_profit, :op, :remark

  belongs_to :trade
end
