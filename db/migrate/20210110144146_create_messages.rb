class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :author, :limit => 50, :default => ''
      t.text :body, :limit => 280, null: false
      t.boolean :read, default: false

      t.timestamps
    end
  end
end
