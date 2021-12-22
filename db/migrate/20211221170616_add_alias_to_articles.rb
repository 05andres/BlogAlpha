class AddAliasToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :alias , :string
  end
end
