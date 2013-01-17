class ChangeDefaultHiddenCategory < ActiveRecord::Migration
  def change
    change_column_default :categories, :hidden, false
  end
end
