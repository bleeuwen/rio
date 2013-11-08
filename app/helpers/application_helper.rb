module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "RIO"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  def toon_prijs(prijs)
    number_to_currency(prijs,:unit=>'€ ')
  end
end
