class ItemReference < ApplicationRecord
  belongs_to :item_referenceable, polymorphic: true

  validates_uniqueness_of :item_unique_id,  scope: [:item_referenceable_type, :item_referenceable_id],
                           message: 'cannot be duplicated'
  
end
