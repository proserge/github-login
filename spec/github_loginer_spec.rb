require 'github_loginer'

feature 'User signs in' do
  scenario 'with valid email and password' do
    test = GithubLoginer.new(VALID_LOGIN, VALID_PASSWORD)
    test.login_to_site
    expect(page).to have_content 'Pull requests'
  end

  scenario 'with valid email and invalid password' do
    test  = GithubLoginer.new(VALID_LOGIN, INVALID_PASSWORD)
    test.login_to_site
    expect(page).to have_content 'Incorrect'
  end

  scenario 'with invalid email and password' do
    test = GithubLoginer.new(INVALID_LOGIN, INVALID_PASSWORD)
    test.login_to_site
    expect(page).to have_content 'Incorrect'
  end
end
