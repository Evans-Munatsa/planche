ActiveAdmin.register Post do

  permit_params :title, :body, :category_id, :user_id

  form do |f|
    f.inputs do
      f.input :title
      f.input :body, :as => :ckeditor
    end
    f.actions
  end
end
