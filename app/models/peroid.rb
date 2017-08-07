class Peroid
  attr_accessor :begin, :end
  def initialize(peroid_params)
  	@begin = peroid_params[:begin]
  	@end = peroid_params[:end]
  end

  def range
  	(@begin..@end)
  end
end