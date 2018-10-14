require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course = courses(:one)
  end

  test "should get index" do
    get courses_url
    assert_response :success
  end
  
  test "should do search" do
    get courses_url
    assert_response :success
  end
  
  test "shouldn't find a missing course" do
    get courses_url
    assert Course.where("name like ?", "Basketball").length == 0
  end

  test "should find a created course" do
    get courses_url
    assert Course.where("name like ?", "Racquetball").length == 1
  end
  
  test "searches always return 200" do
    get courses_url, params: { query: "Astrophysics" }
    assert_equal 200, status
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
