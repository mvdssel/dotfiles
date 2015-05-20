ffmpeg
======

FLAC > MP3
----------
[bron](https://blogs.fsfe.org/marklindhout/2012/11/converting-flac-files-to-mp3-with-ffmpeg-and-bash/)

    (for FILE in *.flac ; do ffmpeg -i "$FILE" -f mp3 -ab 192000 "`basename "$FILE" .flac`.mp3" || break; done)

