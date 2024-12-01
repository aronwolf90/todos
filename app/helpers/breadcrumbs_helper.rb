module BreadcrumbsHelper
  def breadcrumb_icon(first)
    if first
      icon "home"
    else
      icon "chevron-right"
    end
  end
end
