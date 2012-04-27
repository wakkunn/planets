class Group < ActiveRecord::Base
  validates :name, :presence => true
  validates :name, :uniqueness => true
  
  attr_accessible :name
  
  def as_json(options = {})
    options[:indent] ||= 2
      {
        :id => self.id,
        :name => self.name
      }
  end
end
