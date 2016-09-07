class Message < ApplicationRecord

  belongs_to :event
  has_and_belongs_to_many :event_errors



end
