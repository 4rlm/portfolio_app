class CreateAlgos < ActiveRecord::Migration[5.2]
  def change
    create_table :algos do |t|

      t.timestamps
    end
  end
end
