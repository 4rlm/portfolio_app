require 'wikipedia'

module WordRanker

  # AlgoService.new.run_word_ranker
  def self.run_word_ranker(args={})
    string_block = args.fetch(:original_text, nil)
    title = args.fetch(:title, nil)

    if string_block.nil?
      wiki_hsh = generate_string_block
      string_block = wiki_hsh.fetch(:original_text)
      title = wiki_hsh.fetch(:title)
    end

    result_hsh = {title: title, ranked_words: count_strings(string_block), original_text: string_block }
    result_hsh
  end


  def self.count_strings(string)
    array = string.split(/\W+/)
    array.map!(&:downcase)
    array.reject!{|el| el.length < 5 }
    
    string_count_hash = array.group_by{|e| e}.map{|k, v| [k, v.length]}.to_h
    word_rankings = string_count_hash.sort_by {|key, value| value}.reverse!
    ranked_words = word_rankings.to_h.map { |k,v| "#{k} (#{v})" }.join(',  ')
  end


  def self.generate_string_block
    page = Wikipedia.find(generate_topic)
    wiki_hsh = {title: page.title,  original_text: page.text }
  end

  def self.generate_topic
    topics = ["Economy of the United States", "Nobel Prize in Literature", "Vegan Diet", "Healthy Living", "Austin, Texas", "San Antonio, Texas", "South Korea", "Automobile Dealerships", "Ruby Programming Language", "Cute Animals", "Africa", "Asia", "South America", "Hobbies", "Food", "Cooking", "Art", "Travel"]
    topic = topics.shuffle.sample
  end


end
