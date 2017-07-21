module CostsHelper
  def active_class(cost, c)
    return '' unless c.id == cost.id
    return "active"
  end
end
