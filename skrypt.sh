#!/bin/bash

function show_date {
    echo "Date: $(date)"
}

case $1 in
    --date)
        show_date
        ;;
    *)
        echo "Invalid option"
        ;;
esac
