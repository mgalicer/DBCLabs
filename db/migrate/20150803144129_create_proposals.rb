class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string :title
      t.text :hypothesis
      t.text :summary
      t.references :proposer

      t.timestamps null: false
    end
  end
end
