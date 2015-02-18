ActiveAdmin.register Milestone do
  permit_params :referals_count, :description
  config.filters = false

  index do
    column :referals_count
    column :description
    actions
  end

  form do |f|
    f.inputs do
      f.input :referals_count
      f.input :description
    end
    actions
  end
end
