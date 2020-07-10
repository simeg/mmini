.PHONY: serve start-db lint test fix

serve:
	nodemon --watch server --ext js,html server/index.js

start-db:
	redis-server /usr/local/etc/redis.conf

lint:
	eslint server/*.js
	rubocop cli/*.rb

test:
	ruby cli/test.rb

fix:
	eslint --fix server/*.js
	rubocop -a cli/*.rb
