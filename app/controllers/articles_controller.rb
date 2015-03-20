class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end


  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    @article.source = Article.set_source(params, article_params)
    #raise @article.source.inspect
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Статья была успешно создана.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    @article.source = Article.set_source(params, article_params)
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Статья была успешно обновлена.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Статья была успешно удалена.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:name, :source, :start_page, :finish_page, :link, :creator_login, :creator_data, :source => [:col_name, :col_year, :mag_name, :mag_year,  :type, :output, :is_russian, :in_rinc])
    end
end
