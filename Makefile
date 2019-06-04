PATH := ./node_modules/.bin:$(PATH)
SHELL := /bin/bash
args = $(filter-out $@, $(MAKECMDGOALS))

install:
	yarn

clean:
	rm -rf build
	rm -f build.zip

reinstall:
	make clean
	rm -rf node_modules
	make install

compile:
	make clean
	mkdir build
	stylus -c src/includes/layout.styl -o build
	pug -P src/countries/**/* -o build
	rm build/layout.css

zip:
	zip -r build.zip build