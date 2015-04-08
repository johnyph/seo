class AddUserToUrls < ActiveRecord::Migration
  def change
    add_reference :urls, :user, index: true
    add_foreign_key :urls, :users
    add_reference :urls, :result, index: true
    add_foreign_key :urls, :results
  end
end
