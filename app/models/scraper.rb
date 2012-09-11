class Scraper
  def initialize(url_string, page_id)
    @url = url_string
    @id = page_id
  end
  
  def perform
    browser = Mechanize.new
    page = browser.get(@url)
    doc = Nokogiri::HTML(page.body)
    page_words = doc.css('body').text.split(/\s/).reject {|s| s.empty? || s.length < 4}
    
    page_words.each do |page_word|
      word_in_database = Word.where("word = ?", page_word).first
      if word_in_database
        word_page_association = WordsPage.new
        word_page_association.word_id = word_in_database.id
        word_page_association.page_id = @id
        word_page_association.save
      else
        new_word = Word.new
        new_word.word = page_word
        new_word.save
        
        word_page_association = WordsPage.new
        word_page_association.word_id = new_word.id
        word_page_association.page_id = @id
        word_page_association.save
      end
    end
    
    page.links.map(&:uri).each do |uri|
      if uri.host.nil?
        link = page.uri.host + uri.to_s
      else
        link = uri.to_s
      end
      
      page_in_database = Page.where("url = ?", link).first
      if page_in_database
        Delayed::Job.enqueue Scraper.new(link, page_in_database.id)
      else
        new_page = Page.new
        if 
        new_page.url = link
        new_page.save

        Delayed::Job.enqueue Scraper.new(link, new_page.id)
      end
    end
  end
end
