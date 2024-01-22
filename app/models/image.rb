class Image < ApplicationRecord
  # Determines that the Image record has one attached file
  has_one_attached :file
end
