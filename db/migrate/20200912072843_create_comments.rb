class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :user_id
      t.integer :electric_post_id
      t.integer :boil_post_id
      t.integer :freeze_post_id
      t.integer :danger_post_id
      t.integer :build_post_id

      t.timestamps
    end
  end
end
