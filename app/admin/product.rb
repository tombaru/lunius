ActiveAdmin.register Product do

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
     form do |f|
        f.inputs do
        f.inputs
          f.has_many :photos do |ff|
            ff.input :photo
          end
        end
     f.actions
     end

   controller do
     def permitted_params
       params.permit(:products => [:name, :price, :category_id, :photo, :photos])
     end
   end


  permit_params do
    [:name, :price, :category_id, :photo, :photos]
  end

 
end
