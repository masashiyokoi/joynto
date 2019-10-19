ActiveAdmin.register Advertisement do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :image, :sponsor_id, :link
  #
  # or
  #
  # permit_params do
  #   permitted = [:image, :sponsor_id, :link]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.inputs do
      f.input :image
      f.input :sponsor_id
      f.input :link
    end
    f.actions
  end
end
