class Notifier < ActionMailer::Base
  default :to => "\"MetaphysicalFitness\" <apple.it00@gmail.com>"
  def email_contact(sender)
    mail :from => "\"#{sender[:name]}\" <#{sender[:email]}>", :reply_to => "\"#{sender[:name]}\" <#{sender[:email]}>", :subject => sender[:subject], :body => sender[:message]
  end
end