require test_helper

class <%=controller_class_name %>ControllerTest < ActionController::TestCase
  # Uncomment if you need this
  # fixtures :<%=table_name %>

  def test_index
    get "index"
    assert_response :success
    assert_template "edit"
    
  end
  
  
  def test_edit
    get "edit"
    assert_response :success
    assert_template "edit"
  end
  
  def test_update
    post "update", {:id=>1}
    assert_response :redirect
  end
  
  def test_create_new_<%=singular_name %>_when_none_exists
    <%=class_name %>.delete_all
    get "edit"
    assert_response :success
    assert_template "edit"
  end
  
end
