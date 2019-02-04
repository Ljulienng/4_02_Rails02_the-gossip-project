class Undercomment < ApplicationRecord
  belongs_to :comment
  belongs_to :user
end
