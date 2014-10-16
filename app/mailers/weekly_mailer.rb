class WeeklyMailer < ActionMailer::Base
  default from: "no-one@example.com"

  def weekly_summary(user, finished_task)

    headers["Message-ID"] = "<this-week-in-task@taskitoff.example.com>"
    headers["In-Reply-To"] = "<this-week-in-task@taskitoff.example.com>"
    headers["References"] = "<this-week-in-task@taskitoff.example.com>"

    # list = []
    # finished_task.each {|task| list << task}
    @user = user
    today = Time.now
    start_date = today - 7.days
    @date_range = "from #{start_date.strftime("%b %d %Y")} to #{today.strftime("%b %d %Y")}"
    @finished_task = finished_task

    mail(to: user.email, subject: "Summary of This Weeks Completed Tasks")
  end

end
