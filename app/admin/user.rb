ActiveAdmin.register User do
  permit_params :email, :ip_address, :token, :referals_cout, milestone_users_attributes: [:id, :awarded]
  remove_filter :milestone_users
  filter :milestone_users_awarded, as: :check_boxes, label: 'Awarded users'
  filter :milestones, as: :select, collection: proc { Milestone.all.map{ |a| [a.description, a.id]} }

  index do
    column :email
    column :ip_address
    column :token
    column :confirmed_at
    column :referals_cout
    actions
  end

  show do
    panel "Referals" do
      table_for user.referals.confirmed_referals do
        column :email
        column :ip_address
        column :token
        column :confirmed_at
      end
    end
  end

  form do |f|
    f.inputs do
      f.has_many :milestone_users, new_record: false do |m|
        m.input :awarded, label: "Awarded '#{ m.object.milestone.description }'"
      end
    end
    actions
  end
end
