# frozen_string_literal: true

ActiveAdmin.register Delivery do
  menu priority: 7
  permit_params :name, :terms, :price
end
