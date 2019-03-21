module Users::Header
  private def render_user_header
    div class: "user-header" do
      h1 "Users"
      link "Back to users index", to: Users::Index
    end
  end
end
