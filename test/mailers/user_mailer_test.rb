require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "login_notification" do
    mail = UserMailer.login_notification
    assert_equal "Login notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "destroy_notification" do
    mail = UserMailer.destroy_notification
    assert_equal "Destroy notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
