class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
          t.string :name
          t.text :description

          t.timestamps
    end
  end

  def down
  end
end
