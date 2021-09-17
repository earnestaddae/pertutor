class AddSummaryToForums < ActiveRecord::Migration[6.0]
  def change
    add_column :forums, :summary, :string
  end
end
