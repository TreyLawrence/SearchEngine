class EnginesController < ApplicationController
  def index
    
  end
  
  def create
    @results = []
    query_words = params[:query].split
    query_words.each do |query_word|
      query_word_in_database = Word.where("word = ?", query_word).first
      if query_word_in_databse
        WordsPage.where("word_id = ?", query_word_in_database.id).each do |assoc|
          @results << Page.find(assoc.page_id)
        end
      end
    end
  end
end
