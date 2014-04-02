class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.string :title
      t.text :message
      t.datetime :datetime

      t.timestamps
    end
  end
end
