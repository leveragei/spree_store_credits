source 'https://rubygems.org'
ruby "2.1.1"
gem 'rails', '4.1.4'

version = '2-3-stable'
group :development, :test do
  gem 'spree_api', github: 'spree/spree', branch: version
  gem 'spree_core', github: 'spree/spree', branch: version
  gem 'spree_frontend', github: 'spree/spree', branch: version
  gem 'spree_backend', github: 'spree/spree', branch: version
  gem 'spree_sample', github: 'spree/spree', branch: version
  gem "spree_auth_devise", :github => 'spree/spree_auth_devise', :branch => version
end

gemspec
