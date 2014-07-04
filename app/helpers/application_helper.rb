module ApplicationHelper

  def link_to_project_or_activity(object)
    if object.is_a?(Activity)
      activity_path(object)
    elsif object.is_a?(Project)
      project_path(object)
    else
      ''
    end
  end

end
