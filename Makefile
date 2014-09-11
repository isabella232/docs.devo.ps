dev: install
	@./node_modules/.bin/gulp development --open --port 4000

install:
	@npm install
	@./node_modules/.bin/bower install

build: install
	@./node_modules/.bin/gulp prepare
	@./node_modules/.bin/gulp metalsmith

.PHONY: dev install build
