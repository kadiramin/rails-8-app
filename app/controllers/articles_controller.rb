<<<<<<< HEAD
class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
=======
class ArticlesController < ApplicationController
  def index
    @articles = Article.all  # Fetch all articles
  end
>>>>>>> 20b2a5b (Add contact page)
end
