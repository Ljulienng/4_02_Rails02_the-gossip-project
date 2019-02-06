class Undercomment < ApplicationRecord
  belongs_to :comment
  belongs_to :author, class_name: "User"
end
