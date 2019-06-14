class CreateSamples < ActiveRecord::Migration[5.1]
  def change
    create_table :samples do |t|
      t.string :string_data, null: true, index: true
      t.text :text_data
      t.jsonb :json_data, null: true
      t.boolean :boolean_data, default: true
      t.integer :integer_data
      t.timestamps
    end
  end
end
