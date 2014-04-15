class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.text :body
      t.date :publish_add

      t.timestamps
    end
  end
end
