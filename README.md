Official [documentation website](http://devo.ps) for [devo.ps](http://devo.ps).

## Install

    npm install
    bower install

## Run

    gulp development --port 4000

## Build

This will build the static version of the site in `_site/`:

    make build

**Note**: the make build command runs `gulp prepare` and `gulp metalsmith` to solve some weird race condition that couldn't be solved in gulp (metalsmith would build before public/assets were ready it seems).

The build and push to the `gh-pages` branch is automated w/ devo.ps.