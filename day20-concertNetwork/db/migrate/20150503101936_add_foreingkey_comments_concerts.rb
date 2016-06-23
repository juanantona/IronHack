class AddForeingkeyCommentsConcerts < ActiveRecord::Migration
  def change
  	add_foreign_key :comments, :concerts, name: :fk_comments_concerts
  end
end
