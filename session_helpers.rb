def user_signed_in?
  !HsnewsRb::Session.instance.current_user.nil?
end

def current_user
  HsnewsRb::Session.instance.current_user
end
