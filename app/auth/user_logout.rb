class UserLogout
  def initialize(token)
    @token = token
  end

  def call
    if @token != nil
      { message: "Logged out.", status_code: '200'}.to_json
    else
      {message: "Logout failed.", status_code: '422'}.to_json
    end
  end
end