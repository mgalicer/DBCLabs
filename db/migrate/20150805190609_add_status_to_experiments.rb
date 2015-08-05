class AddStatusToExperiments < ActiveRecord::Migration
  def change
    add_column :experiments, :status, :string
  end
end
