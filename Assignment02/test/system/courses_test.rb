require "application_system_test_case"

class CoursesTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit courses_url
  #
  #   assert_selector "h1", text: "Course"
  # end
  
  test "course not in search" do
	visit sections_url
	fill_in "query", with: "A"
	click_on "Search"
	refute_selector "li"
  end
    
  test "course in search" do
	visit courses_url
	fill_in "query", with: "MyString"
	click_on "Search"
	assert_selector "li", text: "MyString"
  end
end
