#!/bin/bash

# instal·lació: copiar script a /opt i soft link a /bin? O directament es crida des de /opt

TOTAL=0
DIFF=1
INCR=2

METADADES_PATH="/var/log/backup_metadades/"
BACKUP_PATH="/var/backups/"

METADADES_TOTAL_LOG="metadades_total.log"
METADADES_DIFF_LOG="metadades_diff.log"
METADADES_INCR_LOG="metadades_incr.log"

# el segon argument és la ruta del que volem copiar.
TARGET=$2

function backup_total() {

    mkdir $METADADES_PATH >2 /dev/null
    backup_file=$(echo $TARGET | awk -F'/' '{print $NF}').total.$(date +%Y%m%d).tgz

    tar --listed-incremental=$METADADES_PATH$METADADES_TOTAL_LOG --level=$TOTAL -czf $BACKUP_PATH$backup_file $TARGET

    cp $METADADES_PATH$METADADES_TOTAL_LOG $METADADES_PATH$METADADES_INCR_LOG
}

function backup_diff() {

    cp $METADADES_PATH$METADADES_TOTAL_LOG $METADADES_PATH$METADADES_DIFF_LOG
    backup_file=$(echo $TARGET | awk -F'/' '{print $NF}').diff.$(date +%Y%m%d).tgz

    tar --listed-incremental=$METADADES_PATH$METADADES_DIFF_LOG --level=$DIFF -czf $BACKUP_PATH$backup_file $TARGET
}

function backup_incr() {

    backup_file=$(echo $TARGET | awk -F'/' '{print $NF}').incr.$(date +%Y%m%d).tgz

    tar --listed-incremental=$METADADES_PATH$METADADES_DIFF_LOG --level=$INCR -czf $BACKUP_PATH$backup_file $TARGET
}

case $1 in
    $TOTAL)
        backup_total
        ;;
    $DIFF)
        backup_diff
        ;;
    $INCR)
        backup_incr
        ;;
    *)
        echo 'opció no reconeguda'
        ;;
    esac

