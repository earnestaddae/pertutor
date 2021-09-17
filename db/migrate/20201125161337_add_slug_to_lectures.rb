class AddSlugToLectures < ActiveRecord::Migration[6.0]
  def change
    add_column :lectures, :slug, :string
    add_index :lectures, :slug, unique: true
  end
end
