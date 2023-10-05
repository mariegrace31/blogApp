class CreateComents < ActiveRecord::Migration[7.0]
  def change
    create_table :coments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.text :text

      t.timestamps
    end
  end
end
