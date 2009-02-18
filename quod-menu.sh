#!/bin/sh
case $(echo -e "play/pause\nprevious\nnext" | dmenu -p "quodlibet") in
        "play/pause")
                quodlibet --play-pause
                ;;
        "previous")
                quodlibet --previous
                ;;
        "next")
                quodlibet --next
                ;;
esac
