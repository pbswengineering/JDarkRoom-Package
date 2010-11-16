#
# Regular cron jobs for the jdarkroom package
#
0 4	* * *	root	[ -x /usr/bin/jdarkroom_maintenance ] && /usr/bin/jdarkroom_maintenance
