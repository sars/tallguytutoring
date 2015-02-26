module ApplicationHelper
  def width_brogress_bar(referals_cout, max_referals_count)
    referals_cout >= max_referals_count ? 1120 : 1000 / max_referals_count * referals_cout + 120
  end
end
