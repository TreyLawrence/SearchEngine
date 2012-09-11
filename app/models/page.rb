class Page < ActiveRecord::Base
  attr_accessible :url
  
  has_and_belongs_to_many :words
  
  validates :url, presence: true, uniqueness: { case_sensitive: false }
end
