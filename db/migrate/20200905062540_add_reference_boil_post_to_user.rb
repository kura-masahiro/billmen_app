class AddReferenceBoilPostToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :boil_posts, :user, null: false, foreign_key: true
  end
end
