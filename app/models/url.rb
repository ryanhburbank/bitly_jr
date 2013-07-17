class Url < ActiveRecord::Base
  validates :long_url, :presence => true
  validate  :must_be_a_url, on: :create

  def must_be_a_url
    errors.add(:long_url, "url is not valid") unless url.valid?
  end

  def valid?
    if url.long_url.match(/(https?://([-\w\.]+)+(:\d+)?(/([\w/_\.]*(\?\S+)?)?)?)/) == nil
      return false
    else 
      return true
    end
  end
end
