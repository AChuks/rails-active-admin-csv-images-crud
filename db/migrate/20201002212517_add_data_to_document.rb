class AddDataToDocument < ActiveRecord::Migration[5.2]
  def change
    add_column :documents, :data, :binary, after: :title, :limit => 20.megabyte
  end
end
