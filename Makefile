install:
	make install

open:
	open arzhig-ios.xcodeproj

clean:
	rm -rf node_modules
	rm videos.json

create-videos-file:
	yarn install
	node scripts/fetchVideos.js
