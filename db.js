const shortid = require("shortid");
const redis = require("async-redis");

const KEY_URLS = "urls";
let client;

const toDbKey = id => `${KEY_URLS}::${id}`;
const fromDbKey = key => key.split("::")[1];

exports.insert = async url => {
	let id = shortid.generate();

	// Avoid collision
	let reply = await client.get(toDbKey(id));
	while (reply) {
		id = shortid.generate();
		reply = await client.get(toDbKey(id));
	}

	const key = toDbKey(id);

	await client.set(key, url);
	// Set URL as a key too for searching
	await client.set(url, key);

	return id;
};

exports.getByUrl = async url => {
	const key = await client.get(url);
	if (key) {
		return fromDbKey(key);
	}

	return key;
};

exports.getById = async id => {
	return await client.get(toDbKey(id));
};

exports.init = callback => {
	client = redis.createClient(process.env.REDIS_URL);
	client.on("error", err => console.error(err));
	client.on("end", () => console.warn("Redis client connection lost"));
	client.on("warning", warn => console.warn(warn));
	client.on("ready", callback);
};
