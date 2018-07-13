class Loaders::FavoritesLoader < GraphQL::Batch::Loader
  def initialize(current_user)
    @current_user = current_user
  end

  def perform(ids)
    favorite_article_ids = @current_user.favorites.where(article_id: ids).pluck(:article_id)
    ids.each { |id| fulfill(id, favorite_article_ids.include?(id)) }
  end
end
