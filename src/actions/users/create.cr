class Users::Create < BrowserAction
  route do
    redirect to: Users::Index
    # redirect to: Users::Show.with(user_id: "user_id")
    # redirect to: "/somewhere_else"
    # redirect to: Users::Index, status: 301
  end
end
