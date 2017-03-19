class InitialModelCreation < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :name
      t.string :province
      t.string :city
      t.string :postal_code
      t.string :address
      t.string :phone
      t.boolean :default

      t.boolean :archived, default: false
      t.timestamps null: false
    end

    create_table :cards do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :card_token
      t.string :brand
      t.string :last4
      t.string :expiry_month
      t.string :expiry_year
      t.boolean :default

      t.boolean :archived, default: false
      t.timestamps null: false
    end

    create_table :flowers do |t|
      t.string :name
      t.string :description
      t.float :price
      t.integer :stock
      t.string :image

      t.boolean :archived, default: false
      t.timestamps null: false
    end

    create_table :orders do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :card, index: true, foreign_key: true
      t.belongs_to :contact, index: true, foreign_key: true
      t.string :status, default: "in_progress"

      t.timestamps null: false
    end

    create_table :orders_flowers do |t|
      t.belongs_to :order, index: true, foreign_key: true
      t.belongs_to :flower, index: true, foreign_key: true
      t.integer :quantity
      t.float :cost

      t.timestamps null: false
    end
  end
end
