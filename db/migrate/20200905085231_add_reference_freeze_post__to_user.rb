class AddReferenceFreezePostToUser < ActiveRecord::Migration[5.2]
  def change
        add_reference :freeze_posts, :user, null: false, foreign_key: true
  end
end
