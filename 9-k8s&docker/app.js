const express = require("express");
const app = express();
const PORT = 80;

app.get("/", (req, res) => {
	res.send("Hello, Kubernetes + Docker Integration!");
});

app.listen(PORT, () => {
	console.log(`App listening on port ${PORT}`);
});
