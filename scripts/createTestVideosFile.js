const chance = require("chance").Chance();
const fs = require("fs");

const createRandomVideo = index => ({
  id: index,
  name: chance.sentence({ words: 3 }),
  downloadurl: chance.url(),
  sha256: chance.string({ length: 64, pool: "abcdef0123456789" }),
  description: chance.sentence({ word: 10 }),
  created_at: chance.date().toJSON(),
  updated_at: chance.date().toJSON()
});

var fakeData = [];
for (i = 1; i <= 1000; i++) {
  fakeData.push(createRandomVideo(i));
}

fs.writeFileSync("videos-for-tests.json", JSON.stringify(fakeData, null, 2));
