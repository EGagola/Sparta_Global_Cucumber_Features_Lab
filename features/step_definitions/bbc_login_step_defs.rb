Given("I access the BBC login page") do
  bbc_homepage.visit_homepage
  bbc_homepage.click_sign_in_link
end

Given("I input incorrect username details") do
  bbc_sign_in_page.input_invalid_username
end

Given("I input incorrect password details") do
  bbc_sign_in_page.input_valid_password
end

When("I try to login") do
bbc_sign_in_page.click_sign_in_button
end

Then("I receive an error for not finding an account") do
  expect(bbc_sign_in_page.get_username_error_field_value).to eq(bbc_sign_in_page.no_account_error_message)
end

Given("I input an invalid password as t3sting") do
  bbc_sign_in_page.input_invalid_password_too_short
end

Then("I receive an error stating it needs to be at least {int} chars") do |int|
  expect(bbc_sign_in_page.get_password_error_field_value).to eq(bbc_sign_in_page.password_too_short_error)
end

Given("I enter an invalid password as 123456789") do
  bbc_sign_in_page.input_invalid_password_no_letters
end

Then("I receive an error stating it needs to contain letters") do
  expect(bbc_sign_in_page.get_password_error_field_value).to eq bbc_sign_in_page.password_no_letters_error
end

Given("I enter an invalid password as nonumbers") do
  bbc_sign_in_page.input_invalid_password_no_numbers
end

Then("I receive an error stating it needs to contain non-alphabetic characters") do
  expect(bbc_sign_in_page.get_password_error_field_value).to eq bbc_sign_in_page.password_all_letters_error
end

Then("I receive an error stating that details do not match") do
  expect(bbc_sign_in_page.get_general_error_field_value).to eq bbc_sign_in_page.details_do_not_match_error
end

Then("I receive an error stating that the username is missing") do
  expect(bbc_sign_in_page.get_username_error_field_value).to eq bbc_sign_in_page.field_blank_error
end

Then("I receive an error stating that the password is missing") do
  expect(bbc_sign_in_page.get_password_error_field_value).to eq bbc_sign_in_page.field_blank_error
end

Given("I input an incorrect email format as test@test") do
  bbc_sign_in_page.input_invalid_email_format
end

Given("I input a correct password") do
  bbc_sign_in_page.input_valid_password
end

Then("I receive an error stating that the email doesn't look right") do
  expect(bbc_sign_in_page.get_username_error_field_value).to eq bbc_sign_in_page.invalid_email_format_error
end

Given("I input a correct email that does not belong to an account") do
  bbc_sign_in_page.input_valid_email_not_existing_account
end

Then("I receive an error stating that the email isn't associated with an account") do
  expect(bbc_sign_in_page.get_username_error_field_value).to eq bbc_sign_in_page.no_account_for_that_email
end

Given("I input a correct email") do
  bbc_sign_in_page.input_valid_username
end

Given("I input a password that does not match the account") do
  bbc_sign_in_page.input_valid_password
end

Then("I receive an error stating that the password isn't associated with an account") do
  expect(bbc_sign_in_page.get_password_error_field_value).to eq bbc_sign_in_page.wrong_password_for_email
end

Given("I input the matching password") do
  bbc_sign_in_page.input_correct_password
end

Then("I return to the homepage and am logged in") do
  expect(bbc_homepage.check_account_logged_in).to eq "Your account"
end
