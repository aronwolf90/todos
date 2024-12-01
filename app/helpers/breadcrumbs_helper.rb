module BreadcrumbsHelper
  def breadcrumb_icon(first)
    if first
      icon "home", class: "w-3 h-3 me-2.5"
    else
      icon "chevron-right", class: "w-3 h-3"
    end
  end
end
