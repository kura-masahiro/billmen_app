class CreateFreezePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :freeze_posts do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
