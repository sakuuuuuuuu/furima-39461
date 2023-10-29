class CreatePurchaseRecords < ActiveRecord::Migration[7.0]
  def change
    # remove_column :purchase_records, :price,:string

    create_table :purchase_records do |t|
    




      t.references :user  ,null: false
      t.references :item  ,null: false

      
    
      
    

      t.timestamps
    end
  end
end
