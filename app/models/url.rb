class Url < ActiveRecord::Base
  belongs_to :url_type
  belongs_to :user
  belongs_to :result

  searchable do
    text :link
    integer :user_id
  end
end
