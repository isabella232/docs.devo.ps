dev: install consolidate bower
	@./node_modules/.bin/gulp development --open --port 4000

install:
	# @npm --registry=http://r.cnpmjs.org \
       #--cache=${HOME}/.npm/.cache/cnpm \
       #--disturl=http://cnpmjs.org/dist \
       #--userconfig=${HOME}/.cnpmrc \
       #install
	@npm install

bower: install consolidate
	@./node_modules/.bin/bower install

consolidate:
	rm -rf ./node_modules/metalsmith-templates/node_modules/consolidate

.PHONY: dev install bower
