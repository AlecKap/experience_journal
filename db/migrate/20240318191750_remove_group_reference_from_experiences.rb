class RemoveGroupReferenceFromExperiences < ActiveRecord::Migration[7.0]
  def change
    remove_reference :experiences, :group, null: false, foreign_key: true
  end
end
