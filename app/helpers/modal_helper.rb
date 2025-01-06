module ModalHelper
  def modal_footer
    content_tag :div, class: "bg-gray-50 px-4 py-3 sm:flex sm:flex-row-reverse sm:px-6" do
      yield
    end
  end
end
