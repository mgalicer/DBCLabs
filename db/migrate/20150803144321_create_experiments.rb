class CreateExperiments < ActiveRecord::Migration
  def change
    create_table :experiments do |t|
      t.string :title
      t.text :materials
      t.text :procedures
      t.text :observations
      t.text :results
      t.text :conclusion
      t.string :status
      t.references :proposal
      t.references :experimenter

      t.timestamps null: false
    end
  end
end
