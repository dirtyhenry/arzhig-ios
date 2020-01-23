install:
	yarn install
	pip install linode-cli --upgrade
	pip install boto
	brew bundle

open:
	open arzhig-ios.xcodeproj

clean:
	rm -rf node_modules
	rm videos.json

create-videos-file:
	node scripts/fetchVideos.js

setup-linode:
	linode-cli obj --help