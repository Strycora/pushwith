module ApplicationHelper
  def render_nav_links(signed_in)
    content_tag("ul", class: "right") do
      if signed_in
        content_tag("li") do 
          link_to("Workouts", workouts_path)
        end +
        content_tag("li") do
          link_to("Create Workout", new_workout_path)
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
