class CreateStories < ActiveRecord::Migration
  def self.up
    create_table :stories do |t|
      t.string        :code, :title
      t.integer       :position
      t.text          :body
      t.timestamps
    end

    add_index :stories, [:code, :position]
  end

  def self.down
    drop_table :stories
  end
end
