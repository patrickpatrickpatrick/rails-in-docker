module ApplicationHelper

  def create_item_reference_associations(record, item_reference_params)
    parsed_item_references(item_reference_params).each do |item_unique_id|
      if existing_item_reference(item_unique_id)
        check_if_ref_association_exists(record, existing_item_reference(item_unique_id))
      else
        create_new_item_reference(record, item_unique_id)
      end
    end
  end

  def remove_item_reference_associations(record, item_reference_params)
    record.item_references.each do |item_reference|
      if parsed_item_references(item_reference_params).exclude?(item_reference.item_unique_id)
        record.item_references.delete(item_reference)
      end
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

  def existing_item_reference(item_unique_id)
    ItemReference.find_by item_unique_id: item_unique_id
  end

  def check_if_ref_association_exists(record, item_unique_id)
    unless record.item_references.include?(item_unique_id)
      record.item_references.push(item_unique_id)
    end
  end

end
