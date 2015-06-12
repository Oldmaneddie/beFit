class CreateWeeklogs < ActiveRecord::Migration
  def change
    create_table :weeklogs do |t|
      t.integer :tvol
      t.integer :treps
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
