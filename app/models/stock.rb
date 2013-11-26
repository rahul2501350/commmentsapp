class Stock < ActiveRecord::Base
  attr_accessible :fullname, :sector, :symbol
end
