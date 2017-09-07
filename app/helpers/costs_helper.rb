module CostsHelper
  def active_class(cost, c)
    return '' unless c.id == cost.id
    return "active"
  end

  def fee_status(income)
  	return income.feed? ? "<span class='label label-info'>#{t('feed')} : #{income.fee_amount} </span>".html_safe : 
  		"<span class='label label-warning'>#{t('unfeed')}</span>".html_safe
  end
end
