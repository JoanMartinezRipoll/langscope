require 'test_helper'

class SchoolSignupTest < ActionDispatch::IntegrationTest

  test "invalid school signup information" do
    get school_registration_path
    assert_no_difference 'School.count' do
      post school_registration_path, school: { name:  "",
                                               email: "user@invalid",
                                               password:              "foo",
                                               password_confirmation: "bar" }
    end
    assert_template  'schools/registrations/new'
    assert_select 'div#error_explanation' do |element|
      assert_select "li", 3
      assert_match "Password is too short (minimum is 8 characters)", element.to_s
      assert_match "Password confirmation doesn't match Password", element.to_s
      assert_match "Email is invalid", element.to_s
    end
  end


  test "valid school signup information " do
    get school_registration_path
    assert_difference 'School.count', 1 do
      post school_registration_path, school: { name:  "Example school",
                                               email: "school@example.com",
                                               password:              "password",
                                               password_confirmation: "password" }
    end
  end
end
