# frozen_string_literal: true

ActiveAdmin.register Review do
  menu priority: 6
  permit_params :title, :comment, :rating, :status, :book, :user, :book_id, :user_id

  scope :all
  scope 'New', :unprocessed, default: true
  scope 'Processed', :others_status

  action_item :approved, only: :show do
    link_to 'Approved', approved_admin_review_path(review), method: :put
  end
  action_item :rejected, only: :show do
    link_to 'Rejected', rejected_admin_review_path(review), method: :put
  end

  member_action :approved, method: :put do
    review = Review.find(params[:id])
    review.update(status: Review.statuses[:approved])
    redirect_to admin_review_path(review)
  end
  member_action :rejected, method: :put do
    review = Review.find(params[:id])
    review.update(status: Review.statuses[:rejected])
    redirect_to admin_review_path(review)
  end

  index do
    selectable_column
    id_column
    column :book
    column 'Title' do |review|
      link_to review.title, admin_review_path(review)
    end
    column :created_at
    column :user
    column :status
    # column :updated_at
    actions
  end

  filter :book
  # filter :user
  filter :title
  filter :comment
  filter :status, as: :select, collection: Review.statuses
  filter :rating, as: :check_boxes, collection: 0..10
  filter :created_at

  form do |f|
    f.inputs do
      f.input :title
      f.input :comment
      f.input :rating
      f.input :book_id, as: :select, collection:  Book.all.map { |book| [book.title, book.id] }
      f.input :user_id, as: :select, collection:  User.all.map { |user| [user.email, user.id] }
      f.input :status, as: :select, collection: Review.statuses.keys
    end
    f.actions
  end
  config.sort_order = 'created_at_desc'
  config.per_page = [10, 20, 50, 100]
end
