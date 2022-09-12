class CreateDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :details do |t|
      t.integer :pipe_type_id, null: false
      t.integer :pipe_size_id, null: false
      t.timestamps
    end
  end
end
