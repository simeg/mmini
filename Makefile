.PHONY: ci deploy-server deploy-gem fix lint serve start-db test

# Is run on CI/CD
ci: deps lint test

# Deploy server to production
deploy-server:
	git push heroku master

deploy-gem:
	pushd cli && ./../scripts/deploy_gem; popd

# Install dependencies
deps:
	bundle install --gemfile=cli/Gemfile
	npm ci

# Fix all linting errors
fix:
	eslint --fix server/*.js
	rubocop -a cli/*.rb cli/mmini.gemspec

# Run linters
lint:
	eslint server/**/*.js
	rubocop cli/*.rb cli/mmini.gemspec

# Start node server
serve:
	nodemon --watch server --ext js server/index.js

# Start redis instance
start-db:
	redis-server /usr/local/etc/redis.conf

# Run tests
test:
	ruby cli/test/test_mmini.rb
