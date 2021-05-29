class CreateTaggings < ActiveRecord::Migration[6.0]
  def change
    create_table :taggings do |t|
      t.integer :shortened_url_id, null:false
      t.integer :tagging_id, null:false
      t.timestamps
    end
    add_index(:taggings,[:tagging_id,:shortened_url_id])
  end
end
