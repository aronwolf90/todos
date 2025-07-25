module ModalHelper
  def modal_footer
    content_tag :div, class: "bg-gray-50 px-4 py-3 sm:flex sm:flex-row-reverse sm:px-6 native:py-0" do
      yield
    end
  end

  def modal_close_button
    clazz = "mt-3 inline-flex w-full justify-center " +
            "rounded-md bg-white px-3 py-2 text-sm " +
            "font-semibold text-gray-900 shadow-sm ring-1 " +
            "ring-inset ring-gray-300 hover:bg-gray-50 sm:mt-0 sm:w-auto"
    text = "Cancel"

    if feature_flag_native_modals_enabled?
      nil
    elsif web_modal?
      button_tag text, class: clazz, "data-action": "modal#close", type: "button"
    elsif previous_page_exists?
      link_to text, :back, class: clazz, "data-turbo-frame": "_top"
    end
  end

  private

  def web_modal?
    turbo_frame_request?
  end

  def previous_page_exists?
    request.referrer.present?
  end
end
