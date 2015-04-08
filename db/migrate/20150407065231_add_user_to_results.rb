class AddUserToResults < ActiveRecord::Migration
  def change
    add_reference :results, :user, index: true
    add_foreign_key :results, :users
    add_reference :results, :report, index: true
    add_foreign_key :results, :reports
  end
end
