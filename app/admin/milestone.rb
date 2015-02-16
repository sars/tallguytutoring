ActiveAdmin.register Milestone do
  permit_params :referals_count, :description
  config.filters = false

  index do
    column :referals_count
    column :description
  end
end
