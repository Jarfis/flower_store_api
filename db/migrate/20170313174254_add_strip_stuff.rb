class AddStripStuff < ActiveRecord::Migration
  def change
    add_column :users, :stripe_user, :string
  end
end
