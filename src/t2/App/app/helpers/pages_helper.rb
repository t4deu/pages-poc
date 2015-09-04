module PagesHelper
  def cache_key_for_pages
    count = Page.count
    locale = I18n.locale
    max_updated_at = Page.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "pages/all-#{locale}-#{count}-#{max_updated_at}"
  end
end
