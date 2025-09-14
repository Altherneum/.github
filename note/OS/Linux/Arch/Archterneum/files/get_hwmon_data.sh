

# $0 GPU|CPU
# $1 FanSpeed|Temp
# or `GPU path` to get its hwmon path for `fancontrol`
# or `GPU device` to get its hwmon device ID path for `fancontrol`
# or `GPU name` to get base name `amdgpu` for `fancontrol`

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
                    expressedtemp=$(expr $gputemp / 1000)
                    echo $expressedtemp
                fi
                if [ "$2" = "hwmon" ]; then
                    hwmonname="hwmon$num"
                    echo $hwmonname
                fi
                if [ "$2" = "fan" ]; then
                    gpufan=$(more $path/fan1_input)
                    echo $gpufan
                fi
                if [ "$2" = "name" ]; then
                    gpuname=$(more $path/name)
                    echo $gpuname
                fi
                if [ "$2" = "path" ]; then
                    echo $path
                fi
                if [ "$2" = "device" ]; then
                    pathuuid=("udevadm info -a -p $path")
                    uuid=$($pathuuid | grep "looking at device '/devices/pci.*/hwmon/hwmon0'")
                    
                    IFS="/" read -r -a uuidtrimed <<< "${uuid}"
                    
                    echo "${uuidtrimed[1]}/${uuidtrimed[2]}/${uuidtrimed[3]}/${uuidtrimed[4]}"
                fi
            fi
        else
            if [ "$1" = "CPU" ]; then
                if [ "$2" = "temp" ]; then
                    if [ -f $path/temp1_input ]; then
                        cputemp=$(echo $(more $path/temp1_input))
                        expressedtemp=$(expr $cputemp / 1000)
                        echo $expressedtemp
                    fi
                fi
            fi
        fi
        let num=num+1
    done
}

getdata $1 $2