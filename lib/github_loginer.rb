# frozen_string_literal: true

require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'

# This class is used for login process to github.com
class GithubLoginer
  include Capybara::DSL

  def initialize(login, password)
    @path = 'https://github.com'
    @login = login
    @password = password
    Capybara.register_driver :firefox do |app|
      Capybara::Selenium::Driver.new(app, browser: :firefox)
    end
    Capybara.default_driver = :firefox
    Capybara.default_max_wait_time = 5
  end

  def login_to_site
    visit @path
    click_link "Sign\u00a0in"
    fill_in 'login_field', with: @login
    fill_in 'password', with: @password
    click_button 'Sign in'
    sleep 2
  rescue Capybara::ElementNotFound
    puts 'Could not find an element!'
  end
end
