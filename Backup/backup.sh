#!/bin/bash

info () { echo -e "\e[32m[INFO]\e[0m ${1}" ; }
warn () { echo -e "\e[33m[WARN]\e[0m ${1}" ; }
error () { echo -e "\e[31m[ERROR]\e[0m ${1}" ; }


helper()
{
cat <<EOF
Usage: $0 [option]

-s|--server	Server backup
-d|--database	Database backup
-h|--help	Show this help

EOF
}

comm=$1
DBdir="/home/user/mnt/database_backup"
incremental_file="/home/user/mnt/incremental_file"
SRVdir="/home/user/mnt/server_backup"
backupDate=$(date +"%Y%m%d")

[[ $# -gt 1 ]] && { warn "** Used too many args. Use only one. **"; exit 0; }

case $comm in
	"-s"|"--server")
		[[ -d $SRVdir ]] || mkdir -p $SRVdir
		find $SRVdir/* -mtime +7 -delete	#delete files older than week
		tar -g "$incremental_file" -cvzf "$SRVdir/incremental_backup_$backup_date.tar.gz" "$SRVdir"
		;;
	"-db"|"--database")
		[[ -d $DBdir ]] || mkdir -p $DBdir
		find $DBdir/* -mtime +7 -delete		#delete files older than week
		mysqldump -u mediawiki -p password > mysqldump_$(date +%Y-%m-%d).dump
		;;
	"-h"|"--help") helper ;;
	 *) info "** Bad input, use -h|--help **" ;;
esac

exit 0
