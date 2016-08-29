class Message < ApplicationRecord
  after_create_commit { RabbitmqActivityBroadcastJob.perform_later(self) }
end
