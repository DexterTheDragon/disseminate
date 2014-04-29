class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.references :group
      t.string :type
      t.text :data

      t.timestamps
    end
  end
end
