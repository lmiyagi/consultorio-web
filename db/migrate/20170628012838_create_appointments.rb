class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.references :patient, index: true, foreign_key: { to_table: :users }
      t.datetime :date
      t.integer :situation

      t.timestamps
    end
  end
end
