ActiveAdmin.register Exercise do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :sets, :reps, :workout_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :sets, :reps, :workout_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
