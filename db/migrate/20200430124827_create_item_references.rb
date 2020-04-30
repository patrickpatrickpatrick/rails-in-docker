class CreateItemReferences < ActiveRecord::Migration[5.2]
  def change
    create_table :item_references do |t|
      t.text :item_unique_id
      t.belongs_to :item_referenceable, polymorphic: true, index: { name: 'idx_item_refs' }

      t.timestamps
    end
    
  end
end
