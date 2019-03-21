class Projects::Users::Index < BrowserAction
  nested_route do
    text "Render list of users in project #{project_id}"
  end
end
