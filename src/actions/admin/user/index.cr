class Admin::User::Index < BrowserAction
  before require_admin

  get "/foo" do
    text "List of users"
  end

  private def require_admin
    if current_user
      continue
    else
      redirect to: SignIns::New
    end
  end

  private def current_user
    # do authenticate...
    nil
  end
end
