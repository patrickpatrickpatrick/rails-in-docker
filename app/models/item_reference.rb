class ItemReference < ApplicationRecord
  belongs_to :item_referenceable, polymorphic: true
end
