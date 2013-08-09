class Portfolio < ActiveRecord::Base
  attr_accessible :capital, :name

  has_many :trades

end
