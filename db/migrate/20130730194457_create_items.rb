class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.boolean :done, default: false
      t.string :name

      t.timestamps
    end
  end
end
