class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :raw_content
      t.string :uuid
      t.string :event_name
      t.datetime :published_at
      t.string :sender_id
      t.json :data

      t.timestamps
    end
  end
end
