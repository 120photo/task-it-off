desc "Mark past due task as expires in db"
task expire_old_task: :environment do
  Task.where("created_at <= ?", Time.now - 3.days).each do |task|
    task.update_column(:expired, true)
  end
end
