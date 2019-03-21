class Admin::Users::IndexPage < MainLayout
  def content
    text "Content"
  end

  def help_section
    para "Click the 'export' button to export a CSV of all users"
  end
end
