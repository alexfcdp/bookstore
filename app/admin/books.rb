# frozen_string_literal: true

ActiveAdmin.register Book do
  menu priority: 2
  permit_params :title, :description, :price, :quantity, :materials, :published_at,
                :height, :width, :depth, images: [], author_ids: [], category_ids: []

  before_save do |book|
    book.dimensions = { height: book.height, width: book.width, depth: book.depth }
  end
  controller do
    def edit
      @book = Book.find(params[:id])
      return unless @book.dimensions?
      @book.height = @book.dimensions[:height]
      @book.width = @book.dimensions[:width]
      @book.depth = @book.dimensions[:depth]
    end
  end

  index do
    selectable_column
    id_column
    column 'Title' do |book|
      link_to book.title, admin_book_path(book)
    end
    column :price do |book|
      number_to_currency(book.price, unit: '€')
    end
    column :quantity
    column 'Images' do |book|
      if book.images.attached?
        image_tag(book.images.first.variant(resize: '100x100'))
      else
        image_tag('no_cover.jpg', height: 100)
        # content_tag(:span, 'No image')
      end
    end
    column :published_at
    column 'Authors' do |book|
      ul do
        book.authors.each do |author|
          li do
            link_to "#{author.firstname} #{author.lastname}", admin_author_path(author)
          end
        end
      end
    end
    column 'Categories' do |book|
      ul do
        book.categories.each do |category|
          li do
            link_to category.title.to_s, admin_category_path(category)
          end
        end
      end
    end
    actions
  end

  index as: :grid, columns: 5, default: true do |book|
    a href: admin_book_path(book) do
      img src: image_path(url_for(book.images.first.variant(resize: '150x250!'))), alt: book.images.first.name if book.images.attached?
      img src: image_path(url_for('no_cover.jpg')), height: '250!' unless book.images.attached?
      div book.title
      book.authors.each do |author|
        div "#{author.firstname} #{author.lastname}"
      end
    end
  end

  action_item :del_images, only: :show do
    link_to 'Delete all images', images_admin_book_path(book), method: :put if book.images.attached?
  end

  member_action :images, method: :put do
    book = Book.find(params[:id])
    book.images.purge_later
    redirect_to admin_book_path(book)
  end
  member_action :delimg, method: :put do
    book = Book.find(params[:id])
    book.images.find(params[:format]).purge
    redirect_to admin_book_path(book)
  end

  show do
    attributes_table do
      row :title
      row 'Authors' do |book|
        ul do
          book.authors.each do |author|
            li do
              "#{author.firstname} #{author.lastname}"
            end
          end
        end
      end
      row 'Categories' do |book|
        ul do
          book.categories.each do |category|
            li do
              category.title.to_s
            end
          end
        end
      end
      row :price
      row :quantity
      row :published_at
      row :description
      row :materials
      row 'Dimensions', &:properties
      row :created_at
      row :updated_at
      row 'Images' do
        if book.images.attached?
          ul do
            book.images.each do |img|
              li do
                a href: url_for(img) do
                  img src: image_path(url_for(img.variant(resize: '100x200'))), alt: img.filename
                  div link_to "Delete image #{img.filename}", delimg_admin_book_path(book, img.id), method: :put
                  div '-----------------------------'
                end
              end
            end
          end
        else
          content_tag(:span, 'Cover not available')
        end
      end
    end
  end

  filter :title
  filter :price
  filter :quantity
  filter :published_at
  filter :authors
  filter :categories
  filter :created_at
  filter :updated_at

  form(html: { multipart: true }) do |f|
    f.inputs 'Info Book' do
      f.input :title
      f.input :description
      f.input :published_at
      f.input :quantity
      f.input :price
      f.input :materials
    end
    f.inputs 'Dimensions' do
      f.input :height
      f.input :width
      f.input :depth
    end
    f.inputs 'Categories' do
      f.input :category_ids, as: :check_boxes, collection: Category.all.map { |category| [category.title, category.id] }
    end
    f.inputs 'Authors' do
      f.input :author_ids, as: :check_boxes, collection: Author.all.map { |author| [author.to_s, author.id] }
    end
    f.inputs 'Images' do
      f.input :images, as: :file, input_html: { multiple: true }
    end
    f.actions
  end
  config.sort_order = 'title_asc'
  config.per_page = [10, 20, 50, 100]
end
