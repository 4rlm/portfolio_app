module WordSearch

  # AlgosService.new.start_word_search
  def self.start_word_search(args = {})
    @puzzle = args.fetch(:puzzle, make_puzzle)
    @word = args.fetch(:word, 'wolves')
    @word_chars = @word.chars
    @found = []
    @first_letter = @word[0]
    @coords = []
    find_coordinates
    iterate_coords
    score_hsh = check_score
  end

  def self.check_score
    remaining = @word_chars - @found
    found = @found & @word_chars
    remaining.any? ? win = false : win = true
    score_hsh = {string: @word, found: found, remaining: remaining, win: win}
  end

  def self.find_coordinates
    @puzzle.each_with_index do |row, ri|
      find_col_index(row, ri)
    end
  end

  def self.find_col_index(row, ri)
    if row&.include?(@first_letter)
      ci = row.index(@first_letter)
      col = @puzzle.map { |row| row[ci] }
      coord_hsh = { row: row, col: col, ri: ri, ci: ci }
      @coords << coord_hsh
    end
  end

  def self.iterate_coords
    if @coords.any?
      @word_chars[0..-1].each do |letter|
        @coords.each do |coord|
          neighbors = get_neighbors(coord)
          neighbors = neighbors.values.flatten.uniq
          @found << letter if neighbors.include?(letter)
        end
      end
    end
  end

  def self.get_neighbors(coord)
    row_range = get_range(coord[:ri]).to_a
    col_range = get_range(coord[:ci]).to_a
    start = col_range.first
    stop = col_range.last

    neighbors = { top: @puzzle[row_range.first][start..stop],
                  mid: @puzzle[coord[:ri]][start..stop],
                  bot: @puzzle[row_range.last][start..stop]
                }
  end

  def self.get_range(index)
    row_range = (0...7).to_a
    indexes = (index-1..index+1).to_a.map do |new_index|
      row_range.include?(new_index) ? new_index : index
    end
  end

  def self.make_puzzle
    puzzle = [
      ["a", "w", "o", "l", "v", "e", "s"],
      ["s", "o", "a", "w", "a", "h", "p"],
      ["i", "t", "c", "k", "e", "t", "n"],
      ["o", "t", "s", "d", "h", "o", "h"],
      ["s", "e", "h", "g", "s", "t", "a"],
      ["u", "r", "p", "i", "w", "e", "u"],
      ["z", "s", "b", "n", "u", "i", "r"]
    ]
  end


end
