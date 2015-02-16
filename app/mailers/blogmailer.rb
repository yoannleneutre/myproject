class Blogmailer < ActionMailer::Base
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.blogmailer.register.subject
  #
def register(doctor)
    if doctor
		@doctor = doctor
			mail(:to => doctor.email, :subject => "Thank you for your register")
		end
  end
end
