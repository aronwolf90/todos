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
    clazz = "new fixed bottom-3 float-right text-blue-500 " +
            "rounded-full py-3 px-3 bg-blue-600 hover:bg-blue-700 " +
            "text-white block font-medium"

    content_tag :div, "", class: "float-right w-12" do
      link_to path, class: clazz, data: new_button_data do
        icon "plus", class: "w-6 h-6"
      end
    end
  end

  private

  def new_button_data
    if hotwire_native_modal?
      {}
    else
      { turbo_frame: "modal" }
    end
  end
end
