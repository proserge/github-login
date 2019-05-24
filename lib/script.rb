require_relative 'github_loginer.rb'

# Fill login and password strings
LOGIN = ''
PASSWORD = ''

test = GithubLoginer.new LOGIN, PASSWORD
test.login_to_site
