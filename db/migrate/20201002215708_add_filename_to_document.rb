class AddFilenameToDocument < ActiveRecord::Migration[5.2]
  def change
    add_column :documents, :file_name, :string, after: :title
  end
end
