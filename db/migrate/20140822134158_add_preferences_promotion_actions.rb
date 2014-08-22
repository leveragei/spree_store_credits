class AddPreferencesPromotionActions < ActiveRecord::Migration
  def change
    add_column :spree_promotion_actions, :preferences, :string
  end
end
