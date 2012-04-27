class Group < ActiveRecord::Base
  has_many :users, :dependent => :destroy
  
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
  
  def as_json_with_image
    {
      :users => users.map { |u|
        {
          :id => u.id,
          :name => u.name,
          :sex => u.sex,
          :country => u.country,
          :area => u.area,
          :address1 => u.address1,
          :address2 => u.address2,
          :phone => u.phone,
          :catches => u.catches,
          :hits => u.hits,
          :balls => u.balls
        }
      }
    }
  end
end
