require test_helper

class <%=class_name %>Test < ActiveSupport::TestCase
 # uncomment this if you need it
 # fixtures :<%=table_name %>

 # The assumption here is that the  record was created already.
 # Once there is a record, it should not allow the creation of an existing one.
  def test_should_not_create
   c = <%=class_name %>.create({})
   assert !c.save
  end
  
  # Should not be able to remove the last configuration in the system.
  def test_should_not_delete
   c = <%=class_name %>.find :first
   assert !c.destroy
  end
  
  def test_load_method_should_only_find_one
    assert_kind_of(<%=class_name %>, <%=class_name %>.load)
  end
  
  def test_should_create_new_record_on_load_if_none_found
    <%=class_name %>.delete_all
    assert_not_nil <%=class_name %>.load
  end
  
  
  
end
