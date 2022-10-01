require("dotenv").config();
const express = require("express");
const cors = require("cors");
const mongoose = require("mongoose");
const morgan = require("morgan");
const path = require("path");


const PORT = process.env.PORT || 4000;
const app = express();
app.use(express.json());
app.use(cors());
app.use(morgan("dev"));

const DATABASE_NAME = process.env.DATABASE_NAME;
const MONGO_HOST = process.env.MONGO_HOST;
mongoose
  .connect(MONGO_HOST + DATABASE_NAME)
  .then(() => console.log("mongodbDB connected "))
  .catch(() => console.log("mongodbDB is deconnected "));

const BUILD_ADMIN = "../admin/build";
app.use("/admin", express.static(path.join(__dirname, BUILD_ADMIN)));
app.use("/admin/*", express.static(path.join(__dirname, BUILD_ADMIN)));

const BUILD_CLIENT = "../client/build";
app.use("/", express.static(path.join(__dirname, BUILD_CLIENT)));
app.use("/*", express.static(path.join(__dirname, BUILD_CLIENT)));


app.listen(PORT, () => console.log("SERVER IS STARTED ON", PORT));
