require 'test_helper'

# Tests for the parents controller.
class ParentsControllerTest < ActionDispatch::IntegrationTest
  test 'should open new parents form' do
    get new_parents_path,
        headers: { 'HTTP_REFERER' => 'http://example.com/foo' }

    assert_response :success
    assert_select 'input[name="parents[first_name]"]'
    assert_select 'input[name="parents[last_name]"]'
    assert_select 'input[name="parents[user_attributes][email]"]'
    assert_select 'input[name="parents[user_attributes][password]"]'
    assert_equal 'http://example.com/foo', session[:redirect_to]
  end

  test 'should create new parents with user' do
    get new_parents_path,
        headers: { 'HTTP_REFERER' => 'http://example.com/foo' }
    post parents_index_path,
         params: {
           parents: {
             first_name: 'Foo',
             last_name: 'Bar',
             user_attributes:
               {
                 email: 'foo@example.com',
                 password: 'secretfoo'
               }
           }
         }

    assert_redirected_to 'http://example.com/foo'
    assert_nil session[:redirect_to]
    assert_not_nil session[:user_id]
  end
end
