class Article < ApplicationRecord
  has_many :item_references, as: :item_referenceable

  def list_of_item_refs
    item_refs_collection = []
    item_refs_collection += item_references
    if item_refs_collection.any?
      item_refs_collection.uniq.map(&:item_unique_id).sort.join(',')
    end
  end

end
