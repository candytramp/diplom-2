class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :licences, :type, :ltype
  end
end
