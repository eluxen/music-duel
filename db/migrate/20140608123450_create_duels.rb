class CreateDuels < ActiveRecord::Migration
  def change
    create_table :duels do |t|
      t.datetime :deadline
      t.text :description

      t.timestamps
    end
  end
end
