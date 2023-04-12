class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :content, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :comment
      t.references :parent, null: false, foreign_key: true

      t.timestamps
    end
  end
end
