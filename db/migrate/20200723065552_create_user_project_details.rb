class CreateUserProjectDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :user_project_details do |t|
      t.references :user, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
