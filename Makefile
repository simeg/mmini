.PHONY: serve

serve:
	nodemon --watch server --ext js,html server/index.js

start-db:
	redis-server /usr/local/etc/redis.conf

lint:
	eslint server/*.js
