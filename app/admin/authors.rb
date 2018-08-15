# frozen_string_literal: true

ActiveAdmin.register Author do
  menu priority: 3
  permit_params :firstname, :lastname, :biography

  index do
    selectable_column
    id_column
    column 'Author', &:to_s
    column :created_at
    actions
  end

  filter :firstname
  filter :lastname
  filter :created_at
  filter :updated_at

  config.per_page = [10, 20, 50, 100]
end
