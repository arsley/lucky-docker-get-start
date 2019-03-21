class Users::ShowPage < MainLayout
  include Users::Header
  needs user_id : String | Int32

  def content
    render_user_header
  end

  def page_title
    "User #{@user_id}"
  end
end
