class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.refrences :tag
      t.refrences :question
      t.timestamps(null: false)
    end
  end
end
