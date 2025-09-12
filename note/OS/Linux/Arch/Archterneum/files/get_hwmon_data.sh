

# $0 GPU|CPU
# $1 FanSpeed|Temp
# or `GPU path` to get its hwmon path for `fancontrol`

# If value exist echo it, else no temp/fan probe exist
# Only ask for CPU temp, GPU temp, GPU fan speed

getdata() {
    gpulabel="gpu"
    cpulabel="k10temp"
    probeamount=$(ls /sys/class/hwmon/ | wc -l)

    for((num=0; num<$probeamount;))
    do 
        path="/sys/class/hwmon/hwmon"$num
        devicename=$(more $path'/name')

        if echo $devicename | grep -q $gpulabel; then
            if [ "$1" = "GPU" ]; then
                if [ "$2" = "temp" ]; then
                    gputemp=$(more $path/temp1_input)
                    echo $gputemp
                fi
                if [ "$2" = "fan" ]; then
                    gpufan=$(more $path/fan1_input)
                    echo $gpufan
                fi
                if [ "$2" = "path" ]; then
                    echo $path
                fi
            fi
        else
            if [ "$1" = "CPU" ]; then
                if [ "$2" = "temp" ]; then
                    if [ -f $path/temp1_input ]; then
                        cputemp=$(echo $(more $path/temp1_input))
                        echo $cputemp
                    fi
                fi
            fi
        fi
        let num=num+1
    done
}

getdata $1 $2