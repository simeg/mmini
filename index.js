const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");
const validUrl = require("valid-url");

const app = express();
const port = process.env.PORT || 3000;

const db = require("./db");

const initExpress = () => {
	console.log("Redis connected - starting express server");

	app.use(cors());
	app.use(bodyParser.urlencoded({extended: false}));
	app.use(bodyParser.json());

	app.post("/minify", async (req, res) => {
		const url = req.body.url;
		console.log("Received URL: " + url);

		if (!validUrl.isUri(url)) {
			res.status(400).send("Invalid URL: " + url);
		} else {
			// URL is valid
			const id = await db.getByUrl(url);

			if (id) {
				console.log("URL found in DB");
				res.end(id);
			} else {
				console.log("URL not found in DB - storing it");
				const id = await db.insert(url);
				res.end(id);
			}
		}
	});

	app.get("/:id", async (req, res) => {
		const id = req.params.id;
		const url = await db.getById(id);
		console.log("URL", url);
		if (!url) {
			res.status(400).send("No matching URL for: " + id);
		} else {
			res.end(url);
		}
	});

	app.listen(port, () => console.log(`Listening at http://localhost:${port}`));
};

db.init(initExpress);
