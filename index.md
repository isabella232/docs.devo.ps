---
title: Getting started
layout: default
---

# Hello

## World

This is an example of documentation.

    module.exports = {
        "vendor": {
            "js": [
                "vendor/jquery/dist/jquery.js",
                "vendor/highlightjs/highlight.pack.js"
            ],
            "css": [
                "vendor/normalize-css/normalize.css",
                "vendor/highlightjs/styles/monokai.css"
            ]
        },
        "custom": {
            "js": [
                "assets/js/**/*.js"
            ],
            "css": [
                "assets/css/**/*.css"
            ],
            "scss": [
                "assets/scss/**/*.{scss,sass}"
            ]
        }
    }
