class CreateCommunityPages < ActiveRecord::Migration
  def change
    create_table :community_pages do |t|
      t.text :main_text
      t.string :image
      t.references :language, index: true

      t.timestamps
    end
  end
end
