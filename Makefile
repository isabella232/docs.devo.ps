dev: install  bower
	@./node_modules/.bin/gulp development --open --port 4000

install:
	# @npm --registry=http://r.cnpmjs.org \
       #--cache=${HOME}/.npm/.cache/cnpm \
       #--disturl=http://cnpmjs.org/dist \
       #--userconfig=${HOME}/.cnpmrc \
       #install
	@npm install

bower: install
	@./node_modules/.bin/bower install

.PHONY: dev install bower
