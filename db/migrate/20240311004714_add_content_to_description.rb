class AddContentToDescription < ActiveRecord::Migration[7.0]
  def change
    add_column :descriptions, :content, :string
  end
end
