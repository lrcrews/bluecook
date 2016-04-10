class Post < ActiveRecord::Base


  belongs_to :category


  default_scope { order('created_at desc') }


  validates :category,    presence: true
  validates :content,     presence: true
  validates :description, presence: true
  validates :title,       presence: true
  

  # A more SEO optimized URL slug, also check out
  # to_param method
  def slug
    self.title.downcase.gsub(/\W/, "-") unless self.title.nil?
  end


  # Rails normally calls .to_s on the model's id, we're
  # going to add the name of the post to that for SEO
  # reasons.  By keeping id first in the string we don't
  # lose any functionality as calling .to_i (as Rails does)
  # on a string that begins with numbers and then has
  # characters will return the number in front, which is
  # the id we need for the controller to find the correct
  # post.
  def to_param
    "#{id}-#{self.slug}"
  end


end
