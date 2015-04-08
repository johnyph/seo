class Result < ActiveRecord::Base
  belongs_to :keyword
  belongs_to :report
  belongs_to :user
  has_many :urls

  default_scope { 
    joins(:keyword).order("keywords.name ASC")
  }

  def top_ads
    self.urls.select { |url| url.url_type_id == 1 }
  end

  def right_ads
    self.urls.select { |url| url.url_type_id == 2 }
  end

  def normal_links
    self.urls.select { |url| url.url_type_id == 3 }
  end
end
