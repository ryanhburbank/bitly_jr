class Url < ActiveRecord::Base
  validates :long_url, :presence => true
  validates :short_url, :uniqueness => true
  validate  :must_be_a_url, on: :save

  def must_be_a_url
    if url_valid?
      return self
    else
      errors.add(:base, "url is not valid")
    end
  end

  def url_valid?
    if self.long_url.match(/https?:\/\/.+/) == nil
      return false
    else 
      return true
    end
  end

  def self.shorten
    (0...8).map{(65+rand(26)).chr}.join
  end
end
