class ArticlesController < ApplicationController
    before_action :get_article, except: [ :index, :create ]

  def index
    articles = Article.includes(:comments).to_a

    render json: articles.to_json( include: [:comments])
  end

  def show
    render json: @article.to_json(include: [:comments])
  end

  def create
    if article = Article.create(article_params)
      head :created, location: article_url(article)
    else
      render json: article.errors, status: :unprocessable_entity
    end
  end

  def update
    if article = Article.create(article_params)
      head :created
    else
      render json: article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    head @article.destroy ? :no_content : :method_not_allowed
  end

private

def get_article
  head :not_found unless @article = Article.includes( :comments ).find_by_id(params[:id])
end

def article_params
  params.require(:article).permit(
      :title, :body, :published
    )
end

end
