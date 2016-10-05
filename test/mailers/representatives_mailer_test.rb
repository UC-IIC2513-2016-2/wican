require 'test_helper'

class RepresentativesMailerTest < ActionMailer::TestCase
  test "initiative_email" do
    mail = RepresentativesMailer.initiative_email
    assert_equal "Initiative email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
