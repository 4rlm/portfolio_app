Rails.application.routes.draw do
  # root 'home#index'
  get 'home/index'
  root to: 'home#index'


  get 'run_sudoku' => 'algos#run_sudoku'

  resources :thermos
  resources :algos
end





# get 'core_comp_cleaner_btn' => 'cores#core_comp_cleaner_btn' Ex service
