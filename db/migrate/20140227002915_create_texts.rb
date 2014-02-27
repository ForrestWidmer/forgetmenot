class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.string :title
      t.date :date
      t.time :time
      t.text :message

      t.timestamps
    end
  end
end
