#!/bin/sh

TS="$(date +%s)"

for arg in "$@"; do
	name="${arg%%=*}"
	value="${arg#*=}"

	case "$name" in
		output) OUTPUT="${value}";;
		interfaces) INTERFACES="${value}";;
		duration) DURATION="${value}";;
	esac
done

OUTPUT="${OUTPUT:-/data/bmon-${TS}.out}"
INTERFACES="${INTERFACES:-eth*,wlan*}"
DURATION="${DURATION:-600}"

uptime > "${OUTPUT}"
timeout "${DURATION}" bmon -o format:fmt='$(element:name)\tRX bytes: $(attr:rx:bytes)\tTX bytes: $(attr:tx:bytes)\tBytes Rate:\tRX $(attr:rxrate:bytes)\tTX $(attr:txrate:bytes)\n' -p "${INTERFACES}" >> "${OUTPUT}" 2>&1
uptime >> "${OUTPUT}"
