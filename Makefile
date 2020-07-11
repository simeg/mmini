.PHONY: ci deploy fix lint serve start-db test

# Is run on CI/CD
ci: lint test

# Deploy to production
deploy:
	git push heroku master

# Fix all linting errors
fix:
	eslint --fix *.js
	rubocop -a cli/*.rb

# Run linters
lint:
	eslint *.js
	rubocop cli/*.rb

# Start node server
serve:
	nodemon --watch . --ext js,html index.js

# Start redis instance
start-db:
	redis-server /usr/local/etc/redis.conf

# Run tests
test:
	ruby cli/test.rb
