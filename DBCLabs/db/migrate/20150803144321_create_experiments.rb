class CreateExperiments < ActiveRecord::Migration
  def change
    create_table :experiments do |t|
      t.string :title
      t.text :materials
      t.text :proceduress
      t.text :observations
      t.text :results
      t.text :conclusion
      t.references :proposal
      t.references :user

      t.timestamps null: false
    end
  end
end
