class CreateResourceItems < ActiveRecord::Migration
  def change
    create_table :resource_items do |t|
      t.string :resource_type
      t.string :resource_name
      t.string :resource_path

      t.timestamps
    end
  end
end
