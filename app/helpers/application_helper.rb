module ApplicationHelper

  def create_item_reference_associations(record, item_reference_params)
    parsed_item_references(item_reference_params).each do |item_unique_id|
      create_new_item_reference(record, item_unique_id)
    end
  end

protected

  def parsed_item_references(item_reference_params)
    item_reference_params.split(',').map do |item_unique_id|
      format_item_reference(item_unique_id)
    end
    .reject(&:empty?)
    .uniq
  end

  def create_new_item_reference(record, item_unique_id)
    record.item_references.create(item_unique_id: item_unique_id)
  end

  def format_item_reference(item_unique_id)
    item_unique_id.strip.upcase
  end

end
