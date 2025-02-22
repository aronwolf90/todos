class AddTermsConfirmedToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :terms_confirmed, :boolean
  end
end
