class ChangeTypeInDealInfos < ActiveRecord::Migration[7.0]
  def change
    rename_column :deal_infos, :type, :deal_type
  end
end
