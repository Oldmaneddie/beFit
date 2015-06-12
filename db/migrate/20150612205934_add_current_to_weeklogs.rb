class AddCurrentToWeeklogs < ActiveRecord::Migration
  def change
    add_column :weeklogs, :current_week, :boolean
  end
end
