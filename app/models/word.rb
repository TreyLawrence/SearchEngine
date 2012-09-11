class Word < ActiveRecord::Base
  attr_accessible :word
  
  has_and_belongs_to_many :pages
  
  validates :word, presence: true, uniqueness: { case_sensitive: false }
end
