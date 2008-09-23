# The <%=class_name %> model acts as the interface to the <%=table_name %> table. 
# The <%=table_name %> table should consist of only one row with one column for each configuration field in your system. 
#
# Callbacks prevent rows from being added to or removed from the table.
#
class <%=class_name %> < ActiveRecord::Base
  
    before_create :check_for_existing
    before_destroy :check_for_existing

   # class methods
   
   # Returns the system configuration record. You should use this instead of doing an explicit #find on this object, as this
   # method will retrieve only the first row from the table.
   #
   # If no configuration record exists, one will be created with blank fields.
   def self.load
     

      <%=singular_name %> = <%=class_name %>.find :first
       if <%=singular_name %>.nil?
         <%=singular_name %> = <%=class_name %>.create() 
       end
      <%=singular_name %>
   end
    

   protected
   
   # Prevents the destruction or creation of more than one record.
   def check_for_existing
        return false if <%=class_name %>.find(:all).size >= 1 
    end
end