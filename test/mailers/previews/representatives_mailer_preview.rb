# Preview all emails at http://localhost:3000/rails/mailers/representatives_mailer
class RepresentativesMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/representatives_mailer/initiative_email
  def initiative_email
    RepresentativesMailer.initiative_email
  end

end
