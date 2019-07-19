class UpdateMachineSnacks < ActiveRecord::Migration[5.1]
  def change
		rename_column :machine_snacks, :machines_id, :machine_id
		rename_column :machine_snacks, :snacks_id, :snack_id
  end
end
