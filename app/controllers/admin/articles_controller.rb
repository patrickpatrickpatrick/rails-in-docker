class Admin::ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    @item_referenceable = @article
    @item_references = @item_referenceable.item_references
    @item_reference = ItemReference.new
  end

  def new
    @article = Article.new
    5.times { @article.item_references.build }
  end

  def edit
    @item_referenceable = @article
    @item_references = @item_referenceable.item_references
    @item_reference = ItemReference.new
    5.times { @article.item_references.build }
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to admin_article_path(@article), notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to admin_article_path(@article), notice: 'Article was successfully updated.' 
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to admin_articles_url, notice: 'Article was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title,
                                      :content,
                                      item_references_attributes: [:item_unique_id,
                                                                   :id, :item_reference_id,
                                                                   :item_reference_type,
                                                                   :_destroy])
    end
end
