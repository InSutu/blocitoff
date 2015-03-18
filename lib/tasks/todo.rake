#namespace :todo do
 # desc "Delete items older that seven days."
  task deleted_items: :environment do
    Task.where("created_at <= ?", Time.now - 7.days).destroy_all
  end

