FactoryBot.define do
  factory :item_reference do
    item_referenceable_id { 1 }
    item_referenceable_type { "MyString" }
  end
end
