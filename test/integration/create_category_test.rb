require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
  setup do
    @admin_user = User.create(username: "carlos", email: "carlos2494@gmail.com",
                              password: "password", admin: true )
    sin_is_as(@admin_user)
  end

  test "get new category form and create category" do
     get "/categories/new"
     assert_response :success
     assert_difference 'Category.count', 1 do
       post categories_path, params: { category: { name: "Sport" } }
       assert_response :redirect
     end
     follow_redirect!
     assert_response :success
     assert_match "Sport", response.body
   end

   test "get new category form and reject invalid category submission" do
     get "/categories/new"
     assert_response :success
     assert_no_difference 'Category.count' do
       post categories_path, params: { category: { name: " " } }
     end
     assert_match "following", response.body
     assert_select 'li.text-red-500'
   end
end
