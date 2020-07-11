.PHONY: serve start-db lint test fix

serve:
	nodemon --watch . --ext js,html index.js

start-db:
	redis-server /usr/local/etc/redis.conf

lint:
	eslint *.js
	rubocop cli/*.rb

test:
	ruby cli/test.rb

fix:
	eslint --fix *.js
	rubocop -a cli/*.rb
