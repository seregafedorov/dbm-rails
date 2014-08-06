class CreateProjectRelation < ActiveRecord::Migration
  def change
    create_table :project_relations do |t|
      t.integer :parent_id
      t.integer :child_id
    end
  end
end
