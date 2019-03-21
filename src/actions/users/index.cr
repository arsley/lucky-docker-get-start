class Users::Index < BrowserAction
  route do
    render IndexPage, user_names: ["Paul", "Sally", "Jane"]
  end
end
