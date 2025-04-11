#!/system/bin/sh

cmd=$1
echo "commonService.sh cmd:$cmd"

function func_dmesg()
{
    #exit and restart
    #/system/bin/dmesg -w  > /data/log/dmesg.log

    #exit and restart
    #/system/bin/dmesg -w |tee -a /data/log/dmesg.tee.log

    #output nothing
    #rm /data/log/log.dmesg-c.log
    #while true
    #do
    #    /system/bin/dmesg -c >> /data/log/log.dmesg-c.log
    #    sleep 1
    #done
}

function func_chmodbtlog()
{
    ##default 600 and fail to upload when bug report.
    if [ -d /data/log/1/btlog ];then
        /system/bin/chmod 0666 /data/log/1/btlog/*
    fi
    if [ -d /data/log/2/btlog ];then
        /system/bin/chmod 0666 /data/log/2/btlog/*
    fi
    if [ -d /data/log/3/btlog ];then
        /system/bin/chmod 0666 /data/log/3/btlog/*
    fi
}

function showUsage()
{
    echo "Usage:"
    echo "commonService.sh dmesg"
    echo "commonService.sh chmodbtlog"
}

case "$cmd" in
    "dmesg")
        func_dmesg
        ;;
    "chmodbtlog")
        func_chmodbtlog
        ;;
    *)
        showUsage
        ;;
esac
