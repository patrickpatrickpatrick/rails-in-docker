class Article < ApplicationRecord
  has_many :item_references, as: :item_referenceable
  accepts_nested_attributes_for :item_references, allow_destroy: true,
    :reject_if => proc { |att| att[:item_unique_id].blank? }

end
