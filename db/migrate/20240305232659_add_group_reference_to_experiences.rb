class AddGroupReferenceToExperiences < ActiveRecord::Migration[7.0]
  def change
    add_reference :experiences, :group, null: false, foreign_key: true
  end
end
