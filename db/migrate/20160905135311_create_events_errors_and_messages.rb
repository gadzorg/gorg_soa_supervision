class CreateEventsErrorsAndMessages < ActiveRecord::Migration[5.0]
  def change



    create_table :events do |t|
      t.uuid :uuid, default: 'uuid_generate_v4()', null: false, unique: true
      t.string :event_name
      t.datetime :published_at
      t.string :sender_id
      t.json :data

      t.timestamps
    end

    create_table :messages do |t|
      t.string :raw_content
      t.belongs_to :event

      t.timestamps
    end

    create_table :event_errors do |t|
      t.uuid :uuid, default: 'uuid_generate_v4()', null: false, unique: true
      t.string :error_type
      t.string :sender
      t.string :message
      t.datetime :published_at
      t.json :debug_data
      t.belongs_to :event

      t.timestamps
    end

    create_table :event_errors_messages, id: false do |t|
      t.belongs_to :event_error, index: true
      t.belongs_to :message, index: true
    end

  end
end
