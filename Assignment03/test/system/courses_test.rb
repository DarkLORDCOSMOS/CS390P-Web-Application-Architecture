require "application_system_test_case"

class CoursesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit courses_url
    assert_selector "h1", text: "Courses"
    assert_selector "th", text: "Name"
    assert_selector "td", text: "Racquetball"
  end
  
  test "course not in search" do
	visit courses_url
	fill_in "query", with: "Baking"
	click_on "Search"
	refute_selector "td"
  end
    
  test "course in search" do
	visit courses_url
	fill_in "query", with: "Vul"
	click_on "Search"
	assert_selector "td", text: "Vulcan Language & Culture"
	sleep 5
  end
end
