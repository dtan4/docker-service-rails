#!/bin/bash

sleep 5

bin/rake db:create
bin/rake db:migrate

exec $@
