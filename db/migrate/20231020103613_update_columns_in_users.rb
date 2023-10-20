class UpdateColumnsInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :photo, :string, null: true, default: "https://images.unsplash.com/photo-1594897030264-ab7d87efc473?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2940&q=80"
    change_column :users, :posts_count, :integer, null: true, default: 0
  end
end
