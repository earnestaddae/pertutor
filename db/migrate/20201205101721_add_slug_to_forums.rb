class AddSlugToForums < ActiveRecord::Migration[6.0]
  def change
    add_column :forums, :slug, :string
    add_index :forums, :slug, unique: true
  end
end
