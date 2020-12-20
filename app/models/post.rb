class Post < ApplicationRecord
  has_one_attached :image
  has_rich_text :body
  belongs_to :user,optional: true
  has_many :Articles
  
  acts_as_taggable 

  def self.search(search)
    if search != ""
      Post.where('text LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end

  def divide_monthly
    return self.articles.group("strftime('%Y%m', articles.created_at)")
                                 .order(Arel.sql("strftime('%Y%m', articles.created_at) desc"))
                                 .count
  end

  private
  def image_content_type
    extension = ['image/png', 'image/jpg', 'image/jpeg']
    errors.add(:image, "の拡張子が間違っています") unless image.content_type.in?(extension)
  end

  def was_attached?
    self.image.attached?
  end

  
end
