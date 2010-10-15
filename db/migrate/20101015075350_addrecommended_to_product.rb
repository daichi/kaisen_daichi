class AddrecommendedToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :recommended, :boolean
  end

  def self.down
  end
end
