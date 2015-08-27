ffmpeg
======

FLAC > MP3
----------
[bron](https://blogs.fsfe.org/marklindhout/2012/11/converting-flac-files-to-mp3-with-ffmpeg-and-bash/)

    (for FILE in *.flac ; do ffmpeg -i "$FILE" -f mp3 -ab 192000 "`basename "$FILE" .flac`.mp3" || break; done)

M3U8-stream > MPEG-TS
---------------------
[bron](zdf_hds_de-f.akamaihd.net/i/de09_v1@87012/index_1456_av-b)

    ffmpeg -i “http://source.com/stream.m3u8″ -c copy video.ts

M3U-stream > MP3
---------------------
[bron](http://osxdaily.com/2014/02/06/play-convert-m3u-file-mac/)

1. Download m3u-file
2. Extract the url of the mp3 via a texteditor
3. Download the mp3

    curl -O http://source.com/name.mp3
