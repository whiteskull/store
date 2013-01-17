module ApplicationHelper

  def display_none_if(condition = true)
    if condition
      'display: none;'
    end
  end
end
