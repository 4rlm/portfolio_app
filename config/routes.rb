Rails.application.routes.draw do
  get 'home/index'
  root to: 'home#index'

  resources :algos do
    collection do
      match 'run_sudoku' => 'algos#run_sudoku', via: [:get, :post], as: :run_sudoku
      match 'servicer' => 'algos#servicer', via: [:get, :post], as: :servicer
    end
  end

  resources :thermos
end





# get 'core_comp_cleaner_btn' => 'cores#core_comp_cleaner_btn' Ex service
