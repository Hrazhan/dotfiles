#! /bin/sh

case "$1" in
	hide) polybar-msg cmd hide | bspc config bottom_padding 0 ;;
	show) polybar-msg cmd show | bspc config bottom_padding 32 ;;
esac
