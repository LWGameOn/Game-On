class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.references :user
      t.text :complaint
      
      t.timestamps
    end
  end
end
