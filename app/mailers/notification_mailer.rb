class NotificationMailer < ActionMailer::Base
  default from: "no-reply@ianjonesnomster.com"

  def comment_added
    mail(to: "jones.kent@gmail.com",
         subject: "Hello From Rails Mailer")
  end
end
