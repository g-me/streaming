
 :screen-fps=60.000000 :live-caching=300 :screen-left=100 :width=300

 screen:// :screen-fps=20 :screen-caching=100 
 --sout="#transcode{vcodec=h264,vb=0,scale=0,acodec=mpga,ab=128,channels=2,samplerate=44100}
 :duplicate{dst=http{mux=ffmpeg{mux=flv},dst=:8080/},dst=display}" --sout-keep 


vlc screen:// :screen-fps=30 :screen-caching=100 --sout 
'#transcode{vcodec=mp4v,vb=4096,acodec=mpga,ab=256,scale=1,width=1280,height=800}:
rtp{dst=192.168.1.26,port=1234,access=udp,mux=ts}'

vlc screen:// :screen-fps=30 :screen-caching=100 --sout '#transcode{vcodec=mp4v,vb=4096,acodec=mpga,ab=256,scale=1,width=1280,height=800}:rtp{dst=192.168.1.26,port=1234,access=udp,mux=ts}'

where:

* screen:// is our input module selection
* :screen-fps=30 specifies that we want to screengrab at 30 fps (from default 5 fps)
* :screen-caching=100 sets the internal caching to 100ms (from default 300 ms)
* --sout is our output chain.
* #transcode tells vlc that we first want to transcode the input using parameters to follow
* {} contains our transcoding parameters
* vcodec=mp4v sets the video codec to mpeg4 video
* vb=4096 sets the bitrate of the transcoded video (4Mb/s)
* acodec=mpga sets the audio codec to mpeg audio (mp3). Audio does not work yet, this is a place holder.
* ab=256 sets the bitrate of the transcoded audio (256 Kb/s)
* scale=1 sets the scaling value
* width=1280 sets the width of the transcoded video to 1280 pixels
* height=800 sets the height of the transcoded video to 800 pixels
* :rtp tells VLC that we want to use rtp protocol to send the encoder output to our receiver machine using Real Time Protocol.
* dst=192.168.1.2 is the ip address of our destination/playback machine
* port=1234 is the default port on the destination/playback machine
* access=udp specifies UDP protocol
* mux=ts sets multiplexing to mpeg-2 Transport stream


Note
------

Found that RTP is the protocol of choice for video streaming.
there are android rtp streamig client libraries



Google's documentation recommends H.264 with a bitrate of 500kbps, and AAC-LC at 128kbps for audio
http://www.techradar.com/news/home-cinema/best-codecs-for-video-and-how-to-encode-1044575


new resources on RTP and android
------------------------------------

https://www.wowza.com/forums/content.php?62-How-to-troubleshoot-RTSP-RTP-playback

http://androidsourcecode.blogspot.com/2013/10/android-rtp-sample-receiving-via-vlc.html