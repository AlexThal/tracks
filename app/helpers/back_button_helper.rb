module BackButtonHelper
  def back_button
    redirect_to :back do
      content_tag(:i, '', class: 'back-icon fa-solid fa-angle-left')
    end
  end
end
