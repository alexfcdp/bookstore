# frozen_string_literal: true

class OrderService
  def initialize(user, order_id = '')
    @user = user
    @order_id = order_id
  end

  def order
    {
      find: -> { @found_order.decorate if found_order.present? },
      create: -> { create_order.decorate }
    }
  end

  private

  def found_order
    @found_order ||= @user.present? ? find_user_order : find_by_session
  end

  def create_order
    order = @user.present? ? @user.orders.create(params) : Order.create(params)
    order.valid? ? order : create_order
  end

  def find_by_session
    return if @order_id.blank?
    @find_by_session ||= Order.in_progress.find_by(id: @order_id)
  end

  def find_user_order
    @find_user_order ||= @user.orders.in_progress.first
    return @find_user_order if find_by_session.blank?
    OrderMergerService.new(@user, @find_user_order, @find_by_session).call
  end

  def params
    { order_number: "R#{Array.new(8) { [*'0'..'9'].sample }.join}" }
  end
end
