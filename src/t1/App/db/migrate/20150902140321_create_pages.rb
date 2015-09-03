class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.text :description
      t.text :body
      t.string :author

      t.timestamps null: false
    end

    add_index :pages, :slug, unique: true
  end
end
