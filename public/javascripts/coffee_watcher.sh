#!/bin/bash

BASEDIR=$(dirname $0)

coffee --watch --compile --output $BASEDIR/compiled $BASEDIR/coffeescripts/* &

