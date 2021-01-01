#! /bin/bash

if pgrep -x redshift > /dev/null
then
	pgrep redshift | xargs -n1 kill -9 | notify-send 'Redshift stopped'
else
	notify-send 'Redshift started'
	redshift  -l 35.595755:45.448178 &
fi
