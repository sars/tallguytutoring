ActiveAdmin.register Milestone do
  permit_params :referals_count, :description
  config.filters = false
end
