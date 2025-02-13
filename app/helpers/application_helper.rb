module ApplicationHelper
  def turbo_native_app?
    request.user_agent.to_s.include? "Turbo Native"
  end

  def icon(name, **args)
    file_path = File.read(Rails.root.join("app", "assets", "icons", "#{name}.svg"))
    svg_file = Nokogiri::HTML::DocumentFragment.parse(file_path).at_css("svg")

    args.each do |key, value|
      svg_file[key] = value
    end

    svg_file.to_html.html_safe
  end

  def contact_link(**options)
    link_to "aronwolf90@gmail.com", "mailto:aronwolf90@gmail.com", **options
  end
end
