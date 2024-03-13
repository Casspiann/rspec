ActiveAdmin.register Employee do
  permit_params :name, :email, :phoneNo, :address

  config.comments = true

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :phoneNo
    column :address
    actions
  end

  filter :name
  filter :email
  # filter :phoneNo
  # filter :address

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :phoneNo
      f.input :address
    end
    f.actions
  end

 
end
