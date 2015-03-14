class Task < ActiveRecord::Base
  belongs_to :user
    # t.integer  "user_id"
    # t.string   "title"
    # t.datetime "expires_at"
    # t.boolean  "completed"
    # t.datetime "created_at", null: false
    # t.datetime "updated_at", null: false
   def days_left
      (DateTime.now.to_date - created_at.to_date).to_i
   end

end


