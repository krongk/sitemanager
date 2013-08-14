class CreateSmsLogs < ActiveRecord::Migration
  def change
    create_table :sms_logs do |t|
      t.references :user
      t.references :sms_tmp
      t.string :resource
      t.integer :resource_id
      t.integer :status

      t.timestamps
    end
    add_index :sms_logs, :user_id
    add_index :sms_logs, :sms_tmp_id
    add_index :sms_logs, [:resource, :resource_id]
    add_index :sms_logs, :status
  end
end
