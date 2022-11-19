class CreateProjectTimes < ActiveRecord::Migration[7.0]
  def change
    create_table :project_times do |t|
      t.time :time, null: false
      t.date :date, null: false
      t.text :description, null: false
      t.belongs_to :project, null: false

      t.timestamps
    end
  end
end
