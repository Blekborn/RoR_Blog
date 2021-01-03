class AddRememberDigestToAuthors < ActiveRecord::Migration[6.1]
  def change
    add_column :authors, :remember_digest, :string
  end
end
