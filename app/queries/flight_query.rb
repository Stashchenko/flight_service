# frozen_string_literal: true

class FlightQuery
  PAGINATES_PER_PAGE = 100

  def initialize(params: {})
    @scope = Flight.includes(:provider)
    @params = params
  end

  def call
    filter_from if params[:from].present?
    paginate
    @scope
  end

  private

  attr_reader :params

  def filter_from
    @scope = @scope.from_airport(params[:from])
  end

  def paginate
    page = params[:page].to_i.zero? ? 1 : params[:page].to_i
    @scope = @scope.page(page).per_page(PAGINATES_PER_PAGE)
  end
end
