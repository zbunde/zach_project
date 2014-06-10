class Mailer < ActionMailer::Base
  default :from => 'http://localhost:3000'

  def welcome_email(company)
    @company = company
    @url = "fixthislater"
    mail(to: @company.email, subject: 'Welcome to My Awesome Site')
  end

  def invite_owner(owner, company)
    @company = company
    @url = "fixthislater"
    mail(to: owner, subject: "#{@company} has invited you to join")

  end

end
