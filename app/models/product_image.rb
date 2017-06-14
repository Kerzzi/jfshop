class ProductImage < ApplicationRecord

  belongs_to :product

  #指定图片存储的路径规则和图片尺寸
  has_attached_file :image,:path => ":class/:attachment/:id/:basename.:extension"

  validates :image, :attachment_presence => true

  #限制上传类型
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
