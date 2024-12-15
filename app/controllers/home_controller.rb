class HomeController < ApplicationController
  def index
    @articles = Article.limit(3).order(created_at: :desc)  # Display recent posts
  end
end
