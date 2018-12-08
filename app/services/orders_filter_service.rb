# frozen_string_literal: true

class OrdersFilterService
  def initialize(user, params)
    @user = user
    @params = params
  end

  def call
    return orders.accepted if @params.blank?
    orders.accepted.send(@params)
  end

  private

  def orders
    @user.orders
  end
end
