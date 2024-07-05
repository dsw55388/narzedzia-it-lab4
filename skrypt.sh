#!/bin/bash

function show_date {
    echo "Date: $(date)"
}

function create_logs {
    local num_files=${1:-100}
    local prefix=${2:-log}
    for ((i=1; i<=num_files; i++)); do
        filename="${prefix}${i}.txt"
        echo -e "Filename: $filename\nScript: skrypt.sh\nDate: $(date)" > "$filename"
    done
    echo "$num_files ${prefix} files created."
}

function init_repo {
    git clone https://github.com/twoje-repozytorium.git .
    export PATH=$PATH:$(pwd)
    echo "Repo cloned and cwd added to path"
}

function show_help {
    echo "--date | -h              Show current date"
    echo "--logs [N] | -l [N]      Create N log files"
    echo "--error [N] | -e [N]     Create N error log files"
    echo "--init | -i              Initialize repository"
    echo "--help | -h              Show this help message"
}

case $1 in
    --date|-d)
        show_date
        ;;
    --logs|-l)
        if [[ -n "$2" && "$2" =~ ^[0-9]+$ ]]; then
            create_logs "$2" "log"
        else
            create_logs 100 "log"
        fi
        ;;
     --error|-e)
        if [[ -n "$2" && "$2" =~ ^[0-9]+$ ]]; then
            create_logs "$2" "error"
        else
            create_logs 100 "error"
        fi
        ;;
    --init|-i)
        init_repo
        ;;
    --help|-h)
        show_help
        ;;
    *)
        echo "Invalid option"
        ;;
esac
