module ButtonsHelper
  def icon(name, **args)
    file_path = File.read(Rails.root.join("app", "assets", "icons", "#{name}.svg"))
    svg_file = Nokogiri::HTML::DocumentFragment.parse(file_path).at_css("svg")

    args.each do |key, value|
      svg_file[key] = value
    end

    svg_file.to_html.html_safe
  end

  def new_button(path)
    content_tag :div, "", class: "float-right w-12" do
      link_to path, class: "new fixed bottom-3 float-right text-blue-500 rounded-full py-3 px-3 bg-blue-600 hover:bg-blue-700 text-white block font-medium", data: { turbo_frame: "modal" } do
        icon "plus", class: "w-6 h-6"
      end
    end
  end

  def show_button(path)
    link_to path, class: ".show ml-2 rounded-lg py-3 px-3 bg-gray-100 inline-block font-medium" do
      icon "eye"
    end
  end

  def edit_button(path)
    link_to path, class: "edit rounded-lg py-3 px-3 bg-gray-100 inline-block font-medium" do
      icon "pencil"
    end
  end

  def delete_button(path)
    button_to path, method: :delete, class: "destroy rounded-lg py-3 px-3 bg-gray-100 font-medium inline-block" do
      icon "trash"
    end
  end
end
