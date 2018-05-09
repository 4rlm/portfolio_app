Rails.application.routes.draw do
  get 'home/index'
  root to: 'home#index'

  resources :algos do
    collection do
      match 'run_sudoku' => 'algos#run_sudoku', via: [:get, :post], as: :run_sudoku
      match 'run_anagrams' => 'algos#run_anagrams', via: [:get, :post], as: :run_anagrams
      match 'run_roman_numerals' => 'algos#run_roman_numerals', via: [:get, :post], as: :run_roman_numerals
      match 'run_word_ranker' => 'algos#run_word_ranker', via: [:get, :post], as: :run_word_ranker
      match 'run_pig_latin' => 'algos#run_pig_latin', via: [:get, :post], as: :run_pig_latin
      match 'run_palindrome' => 'algos#run_palindrome', via: [:get, :post], as: :run_palindrome
      match 'run_word_search' => 'algos#run_word_search', via: [:get, :post], as: :run_word_search
      match 'run_ssn_tool' => 'algos#run_ssn_tool', via: [:get, :post], as: :run_ssn_tool
      # match 'servicer' => 'algos#servicer', via: [:get, :post], as: :servicer
    end
  end

  resources :thermos
end





# get 'core_comp_cleaner_btn' => 'cores#core_comp_cleaner_btn' Ex service
