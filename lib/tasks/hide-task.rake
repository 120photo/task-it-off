desc "Mark past due task as expires in db"
task expire_old_task: :environment do
  Task.where("created_at <= ?", 7.days.ago).each do |task|
    task.update_column(:expired, true)
  end
end

desc "Send out email of task completed within last week"
task email_finished_tasks: :environment do
  User.all.each do |user|
    WeeklyMailer.weekly_summary(user).deliver
  end
  # WeeklyMailer.weekly_summary(tasks_accomplished.user, finished_task).deliver
end


desc "test task for my email task"
task find_users: :environment do
  users = User.all
  user_id_numbers = []
  # puts user_id in array, used to find
  # task by user's ID numbers
  users.each {|n| user_id_numbers << n.id}

  puts user_id_numbers
end
