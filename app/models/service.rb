class Service < ActiveRecord::Base
  TYPES = %w(
    MailingListService
  )
  belongs_to :group

  store :data

  def self.display_name
    self.model_name.to_s.demodulize.sub('Service', '')
  end
end
