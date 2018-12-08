# frozen_string_literal: true

ActiveAdmin.register Coupon do
  menu priority: 7
  permit_params :code, :discount

  index do
    selectable_column
    column :code
    column :discount
    actions
  end

  filter :code
  filter :discount

  config.sort_order = 'created_at_asc'
  config.per_page = [10, 20, 50, 100]
end
