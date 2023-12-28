// Script to turn genesis into Base64

"use strict";

console.log(require("fs").readFileSync(require("path").resolve(__dirname, "genesis.json")).toString("base64"));
