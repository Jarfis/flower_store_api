class AddRemainingToFlower < ActiveRecord::Migration
  def change
    add_column :flowers, :remaining, :integer
  end
end
