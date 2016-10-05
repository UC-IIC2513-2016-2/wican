class RepresentativesMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.representatives_mailer.initiative_email.subject
  #
  def initiative_email(initiative, user, representative, message)
    @initiative = initiative
    @user = user
    @representative = representative
    @message = message
    mail subject: "Iniciativa: #{initiative.title}", to: representative.email, from: user.email
  end
end
