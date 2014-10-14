desc "Mark past due task as expires in db"
task expire_old_task: :environment do
  Task.where("created_at <= ?", 7.days.ago).each do |task|
    task.update_column(:expired, true)
  end
end

desc "Send out email of task completed within last week"
task email_finished_tasks: :environment do
  finished_task = []
  tasks_accomplished = Task.where(status: true).each do |task|
    finished_task << task.name
    puts finished_task
  end
end
