class Announcement < ActiveRecord::Base
  validates :subject, :content, :presence => true
  validates :subject, :uniqueness => true
  validates :content, :length => { :maximum => 2000 }
  
  attr_accessible :content, :subject
end
