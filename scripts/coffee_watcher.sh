#!/bin/bash

BASEDIR=$(dirname $0)

coffee --watch --compile --output $BASEDIR/../public/javascripts/compiled $BASEDIR/../public/javascripts/coffeescripts/* &

