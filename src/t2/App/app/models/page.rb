class Page < ActiveRecord::Base
  extend FriendlyId

  friendly_id :title, use: :slugged

  validates :slug, uniqueness: true
  validates :title, :description, :body, :author, presence: true

  def slug=(value)
    super(value) if value.present?
  end
end
