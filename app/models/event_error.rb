class EventError < ApplicationRecord

  belongs_to :event
  has_and_belongs_to_many :messages

  def self.verify_or_create(h)
    if e=self.find_by(uuid: h[:uuid])
      h.each do |k,v|
        old_value=e[k]
        raise DefinitionConflict.new("Conflit sur la cle #{k} : #{old_value} => #{v}") unless old_value==v
      end
      e
    else
      self.create(h)
    end
  end

  after_create_commit do |variable|
    self.event.notify_error_change
  end

end
