# frozen_string_literal: true

module RequestHelpers
  def login_as(user)
    post("/users/sign_in", params: { email: user.email, password: user.password })
  end

  def rendered
    Capybara.string(response.body)
  end
end