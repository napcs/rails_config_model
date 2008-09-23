# This configuration controller was generated by the rails_configu_model generator
# 
# This controller provides an interface to quickly edit the values in the <%=table_name %> table.
# See <%=class_name %> for more details on the system configuration.
#

class <%=controller_class_name %>Controller < ApplicationController

  before_filter :find_<%=singular_name %>
  
  
  # Simply redirect to the edit action
  def index
    edit
    render :action=> "edit"
  end
  

  # Shows the page to edit the <%=singular_name %> variables.
  def edit
  end
  
  
  # Saves the posted data to the <%=table_name %> table via the standard
  # Rails mass-assignment update approach.
  def update

    if @<%=singular_name %>.update_attributes(params[:<%=singular_name %>])
      flash[:notice] = 'Your system configuration was successfully updated.'
      redirect_to :action => 'edit'
    else
      render :action=>"edit"
    end
  end

  
  protected
  
  # Before filter to load the configuration data.
  def find_<%=singular_name %>
     @<%=singular_name %> =  <%=class_name %>.load
  end
  
end