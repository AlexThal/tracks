module BackButtonHelper
  def btn_back
    redirect_to :back do
      content_tag(:i, '', class: 'btn-back fa-solid fa-angle-left')
    end
  end
end
