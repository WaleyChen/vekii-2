class GoogClientWrapper
  include Mongoid::Document

  def self
    return Google::APIClient
  end
end