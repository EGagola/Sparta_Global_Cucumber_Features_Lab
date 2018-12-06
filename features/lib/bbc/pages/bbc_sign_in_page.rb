require 'capybara/dsl'

class BbcSignInPage
  include Capybara::DSL

  attr_reader :no_account_error_message, :password_too_short_error, :SIGN_IN_PAGE_URL, :password_no_letters_error, :password_all_letters_error, :details_do_not_match_error, :field_blank_error, :invalid_email_format_error, :no_account_for_that_email, :wrong_password_for_email

  def initialize
    @SIGN_IN_PAGE_URL = 'https://account.bbc.com/signin'
    @no_account_error_message = "Sorry, we can’t find an account with that username. If you're over 13, try your email address instead or get help here."
    @password_too_short_error = "Sorry, that password is too short. It needs to be eight characters or more."
    @password_no_letters_error = "Sorry, that password isn't valid. Please include a letter."
    @password_all_letters_error = "Sorry, that password isn't valid. Please include something that isn't a letter."
    @details_do_not_match_error = "Sorry, those details don't match. Check you've typed them correctly."
    @field_blank_error = "Something's missing. Please check and try again."
    @invalid_email_format_error = "Sorry, that email doesn’t look right. Please check it's a proper email."
    @no_account_for_that_email = "Sorry, we can’t find an account with that email. You can register for a new account or get help here."
    @wrong_password_for_email = "Uh oh, that password doesn’t match that account. Please try again."
  end

  def visit_sign_in_page
    visit(@SIGN_IN_PAGE_URL)
  end

  def input_correct_password
    fill_in('password-input', :with => 'l00plutz')    
  end

  def input_invalid_username
    fill_in('user-identifier-input', :with => 'Moams')
  end

  def input_invalid_email_format
    fill_in('user-identifier-input', :with => 'test@test')
  end

  def input_valid_username
    fill_in('user-identifier-input', :with => 'egagola@spartaglobal.com')
  end

  def input_valid_email_not_existing_account
    fill_in('user-identifier-input', :with => 'elliotgagola@spartaglobal.com')
  end

  def input_invalid_password_too_short
    fill_in('password-input', :with => 't3sting')
  end

  def input_invalid_password_no_numbers
    fill_in('password-input', :with => 'nonumbers')
  end

  def input_invalid_password_no_letters
    fill_in('password-input', :with => '123456789')
  end

  def input_valid_password
    fill_in('password-input', :with => 'FruitM1x')
  end

  def click_sign_in_button
    find('#submit-button').click
  end

  def get_username_error_field_value
    find("#form-message-username").text
  end

  def get_password_error_field_value
    find("#form-message-password").text
  end

  def get_general_error_field_value
    find("#form-message-general").text
  end

end
