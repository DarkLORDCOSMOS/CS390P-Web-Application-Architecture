require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course = courses(:one)
  end

  test "should get index" do
    get courses_url
    assert_response :success
  end

  test "should search course" do
   get :index, params: { query: 'Arc'}
   expect(response.status).to eq(200)
   # assert_not_nil assigns(:query)
   # assert_equal books(:perl_cb).title, assigns(:book).title
   # assert_valid assigns(:book)
   # assert_redirected_to :action => 'index'				
  end
  
  test "should do search" do
    get courses_url
    assert_response :success
  end

  
  test "should get new" do
    get new_course_url
    assert_response :success
  end

  test "should create course" do
    assert_difference('Course.count') do
      post courses_url, params: { course: { credit_hours: @course.credit_hours, department: @course.department, name: @course.name, number: @course.number } }
    end

    assert_redirected_to course_url(Course.last)
  end

  test "should show course" do
    get course_url(@course)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_url(@course)
    assert_response :success
  end

  test "should update course" do
    patch course_url(@course), params: { course: { credit_hours: @course.credit_hours, department: @course.department, name: @course.name, number: @course.number } }
    assert_redirected_to course_url(@course)
  end

  test "should destroy course" do
    assert_difference('Course.count', -1) do
      delete course_url(@course)
    end

    assert_redirected_to courses_url
  end
end
