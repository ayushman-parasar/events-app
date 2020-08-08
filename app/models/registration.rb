class Registration < ApplicationRecord
  belongs_to :event
  belongs_to :user
  # validates :name, presence: true

  HOW_HEARD_OPTIONS = [
    "Newsletter",
    "Blog Post",
    "Twitter",
    "Web Search",
    "Friend/Coworker",
    "Other"
  ]

  # validates :email, format:{ with:/\S+@\S+/ }
  validates :how_heard,
    inclusion:{ in: HOW_HEARD_OPTIONS}
end