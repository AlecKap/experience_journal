class RenameEntryDatesToEntryDates < ActiveRecord::Migration[7.0]
  def change
    rename_table :event_dates, :entry_dates
  end
end
