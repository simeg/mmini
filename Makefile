.PHONY: deploy serve start-db lint test fix

deploy:
	git push heroku master

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
