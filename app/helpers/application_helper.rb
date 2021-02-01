module ApplicationHelper
  def render_nav_links(signed_in)
    content_tag("ul", class: "right") do
      if signed_in
        content_tag("li") do 
          link_to("Workout Groups", workout_groups_path)
        end +
        content_tag("li") do
          link_to("Create Workout Group", new_workout_group_path)
        end +
        content_tag("li") do
          link_to("Join Workout Group", new_user_group_path)
        end +
        content_tag("li") do 
          link_to("Logout", destroy_user_session_path, method: "DELETE")
        end
      else
        content_tag("li") do
          link_to("Login", login_path)
        end + 
        content_tag("li") do 
          link_to("Sign Up", signup_path)
        end
      end
    end
  end
end
