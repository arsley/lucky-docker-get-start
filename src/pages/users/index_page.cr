class Users::IndexPage < MainLayout
  needs user_names : Array(String)

  def content
    ul class: "my-users-list" do
      @user_names.each do |name|
        li name, class: "user-name"
      end
    end

    link "List of users", to: Users::Index

    div class: "email" do
      text "This is the email text"
      br
      span "inbox", class: "email-tag"
      raw "&middot;"
    end
  end

  def page_title
    "List of users"
  end

  def render_sidebar
    text "This is content for the sidebar"
  end
end
