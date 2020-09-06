class AddReferenceBuildPostToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :build_posts, :user, null: false, foreign_key: true
  end
end
