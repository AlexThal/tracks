module ButtonHelper
  def create_session_button
    link_to new_session_path do
      content_tag(:i, '', class: 'plus-icon fa-solid fa-circle-plus')
    end
  end
end
