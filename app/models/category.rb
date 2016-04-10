class Category < ActiveRecord::Base


  has_many :posts


  validates :description, presence: true
  validates :title,       presence: true


  # A more SEO optimized URL slug, also check out
  # to_param method
  def slug
    self.title.downcase.gsub(/\W/, "-") unless self.title.nil?
  end


  # When Rails calls to_param let's make sure it's
  # a SEO optimized string
  def to_param
    "#{id}-#{self.slug}"
  end


end
