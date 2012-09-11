class WordsPage < ActiveRecord::Base
  attr_accessible :page_id, :word_id
  
  belongs_to :page
  belongs_to :word
  
  validates :page_id, presence: true
  validates :word_id, presence: true
end
