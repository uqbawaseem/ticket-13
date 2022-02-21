class Product < ApplicationRecord
    belongs_to :user
    has_one_attached :image
    has_many :suggestions, as: :suggestionable, dependent: :destroy
    accepts_nested_attributes_for :suggestions, reject_if: :all_blank, allow_destroy: true

end