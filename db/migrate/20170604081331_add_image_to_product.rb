class AddImageToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :image, :strin
  end
end
