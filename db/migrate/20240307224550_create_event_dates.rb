class CreateEntryDates < ActiveRecord::Migration[7.0]
  def change
    create_table :entry_dates do |t|
      t.references :experience, null: false, foreign_key: true
      t.date :date, null: false

      t.timestamps
    end

    add_index :entry_dates, [:date, :experience_id], unique: true
    add_index :entry_dates, :date
  end
end
