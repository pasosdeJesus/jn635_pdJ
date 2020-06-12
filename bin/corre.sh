#!/bin/sh
# Inicia servicio

if (test -f ".env") then {
	. .env
} fi;
if (test "$RC" = "") then {
	export RC=sivel2
} fi;
if (test "$RAILS_ENV" = "") then {
	RAILS_ENV=development
} fi;
if (test "$IPDES" = "" && "$PUERTODES" = "") then {
	PUERTODES=2300
	IPDES=127.0.0.1
} fi;
if (test "$RAILS_ENV" = "development") then {
	if (test "$SININD" = "") then {
		bin/rails sip:indices
		CXX=c++ bin/rails assets:precompile --trace
	} fi;
	if (test "$PUERTODES" != "") then {
		cmd="bin/rails s -p $PUERTODES -b $IPDES"
	} else {
		cmd="bin/rails s -b \"$IPDES\""
	} fi;
	echo "$cmd"
	eval "$cmd"
} else {
	if (test ! -f /etc/rc.d/$RC) then {
		echo "Falta script /etc/rc.d/$RC"
		exit 1;
	} fi;
	doas sh /etc/rc.d/$RC -d start
} fi;


