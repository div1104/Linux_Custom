if [ "$1" == "cpu" ] && [ "$2" == "getinfo" ]; then
    echo "CPU Information:"
    lscpu | grep -E "Architecture|Model name|Socket(s)|Thread(s) per core|Core(s) per socket"
elif [ "$1" == "memory" ] && [ "$2" == "getinfo" ]; then
    echo "Memory Information:"
    free -h
else
    echo "Usage: internsctl {cpu|memory} getinfo"
fi