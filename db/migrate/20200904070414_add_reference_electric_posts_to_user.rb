class AddReferenceElectricPostsToUser < ActiveRecord::Migration[5.2]
  def change
     add_reference :electric_posts, :user, null: false, foreign_key: true
  end
end
