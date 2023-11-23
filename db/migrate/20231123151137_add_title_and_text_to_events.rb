class AddTitleAndTextToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :title, :string
    add_column :events, :body, :text
  end
end
