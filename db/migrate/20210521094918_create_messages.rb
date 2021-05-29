class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.integer :person_id
      t.text :title
      t.text :message

      t.timestamps
    end
  end
end
