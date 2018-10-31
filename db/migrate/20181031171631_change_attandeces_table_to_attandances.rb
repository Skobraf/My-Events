class ChangeAttandecesTableToAttandances < ActiveRecord::Migration[5.2]
  def change
  	rename_table :attendences, :attendances
  end
end
