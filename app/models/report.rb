class Report < ActiveRecord::Base
  belongs_to :user
  has_many :results

  before_create :set_name

  self.per_page = 10 # will paginate

  scope :by_user, lambda { |user|
    where(:user_id => user.id)
  }

  def set_name
    self.name = Time.now.strftime("%Y%m%d%H%M%S")
  end
end
