class ConnectionsController < ApplicationController
  before_action :set_article_author, only: [:show, :edit, :update, :destroy]

  # GET /article_authors
  # GET /article_authors.json
  def index
    @article_authors = ArticleAuthor.includes(:article, :person).all
  end

  # GET /article_authors/1
  # GET /article_authors/1.json
  def show
  end

  # GET /article_authors/new
  def new

  end

  # GET /article_authors/1/edit
  def edit
  end

  
  def create

  end

  def update
  end


  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article_author
      @article_author = ArticleAuthor.find(params[:id])
    end

    def connection_params
      params.require(:article_author, :conference_people).permit(:article_id, :person_id, :conference_id, :old_lastname, :is_teacher, :is_staffteacher, :is_student, :is_postgrad, :details)
    end
end
