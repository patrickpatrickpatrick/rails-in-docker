class ItemReferencesController < ApplicationController
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
      # redirect_to [@item_referenceable, :item_references], notice: "Item Reference created"
      redirect_to @item_referenceable, notice: "Item Reference created"
    else
      render :new
    end
  end

  private

  def load_item_referenceable
    resource, id = request.path.split('/')[1,2]
    @item_referenceable = resource.singularize.classify.constantize.find(id)
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
