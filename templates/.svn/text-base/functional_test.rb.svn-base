require File.dirname(__FILE__) + '/../test_helper'
require '<%=controller_file_name %>_controller'

# Re-raise errors caught by the controller.
class <%=controller_class_name %>Controller; def rescue_action(e) raise e end; end

class <%=controller_class_name %>ControllerTest < Test::Unit::TestCase

  fixtures :<%=table_name %>

  def setup
    @controller = <%=controller_class_name %>Controller.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

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
