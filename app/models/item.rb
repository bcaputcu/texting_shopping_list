class Item < ActiveRecord::Base
  attr_accessible :done, :name

  validates_presence_of :name

  def self.current_list
  	Item.where done: false
  end

end
