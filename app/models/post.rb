class Post < ApplicationRecord
  has_one_attached :image
  has_rich_text :body

  validate :image_content_type, if: :was_attached?

  private
  def image_content_type
    extension = ['image/png', 'image/jpg', 'image/jpeg']
    errors.add(:image, "の拡張子が間違っています") unless image.content_type.in?(extension)
  end

  def was_attached?
    self.image.attached?
  end
end
