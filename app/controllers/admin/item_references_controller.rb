class Admin::ItemReferencesController < ApplicationController

  before_action :load_item_referenceable
  
  def index
    @item_references = @item_referenceable.item_references
  end

  def new
    @item_reference = @item_referenceable.item_references.new
  end

  def create
    @item_reference = @item_referenceable.item_references.new(item_referenceable_params)
    if @item_reference.save
      logger.debug "*****Item Referenceable #{@item_referenceable.inspect}"
      # redirect_to [@item_referenceable, :item_references], notice: "Item Reference created"
      redirect_to [:admin, @item_referenceable], notice: "Item Reference created"
    else
      render :new
    end
  end

  private

  def admin_has_access?
    return false unless current_admin && (
      current_admin.has_role?(:superadmin) ||
        current_admin.has_role?(:object_admin))
    true
  end

  def load_item_referenceable
    resource, id_or_slug = request.path.split('/')[2,3]
    logger.debug "******Resource: #{resource}"
    logger.debug "******Id or Slug: #{id_or_slug}"
    if id_or_slug.to_i > 0
      @item_referenceable = resource.singularize.classify.constantize.find(id_or_slug)
    else
      @item_referenceable = resource.singularize.classify.constantize.slug_find(id_or_slug)
    end
  end

  # Alternative load method for use with custom routes

  # def load_item_referenceable
  #   klass = [Article, Event].detect { |c| params["#{c.name.underscore}_id"] }
  #   @item_referenceable = klass.find(params["#{klass.name.underscore}_id"])
  # end

  def item_referenceable_params
    params.require(:item_reference).permit(:item_unique_id)
  end
end
