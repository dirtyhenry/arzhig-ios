const fs = require("fs");
const rp = require("request-promise");

require("dotenv").config();

const signIn = {
  method: "POST",
  uri: `${process.env.STRAPI_BASE_URL}/auth/local`,
  body: {
    identifier: process.env.STRAPI_USER_IDENTIFIER,
    password: process.env.STRAPI_USER_PASSWORD
  },
  json: true
};
rp(signIn)
  .then(authResponse => {
    return rp({
      method: "GET",
      uri: `${process.env.STRAPI_BASE_URL}/arzhig-videos`,
      headers: {
        Authorization: `Bearer ${authResponse.jwt}`
      },
      json: true
    });
  })
  .then(videos => {
    fs.writeFileSync("videos.json", JSON.stringify(videos, null, 2));
  })
  .then(() => {
    console.log("✔︎ Videos written to videos.json");
    process.exit(0);
  })
  .catch(err => {
    console.error(`✘ An error happened: ${err}`);
    process.exit(1);
  });
