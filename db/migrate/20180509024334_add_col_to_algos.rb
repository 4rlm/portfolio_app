class AddColToAlgos < ActiveRecord::Migration[5.2]
  def change
    add_column :algos, :algo_text, :text
    add_column :algos, :algo_string, :string
    add_column :algos, :algo_hsh, :jsonb, null: false, default: '{}', index: true, using: :gin
  end
end
