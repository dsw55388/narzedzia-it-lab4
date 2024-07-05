#!/bin/bash

function show_date {
    echo "Date: $(date)"
}

function create_logs {
    local num_files=${1:-100}
    for ((i=1; i<=num_files; i++)); do
        filename="log${i}.txt"
        echo -e "Filename: $filename\nScript: skrypt.sh\nDate: $(date)" > "$filename"
    done
    echo "$num_files log files created."
}

case $1 in
    --date)
        show_date
        ;;
    --logs)
        if [[ -n "$2" && "$2" =~ ^[0-9]+$ ]]; then
            create_logs "$2"
        else
            create_logs
        fi
        ;;
    *)
        echo "Invalid option"
        ;;
esac
