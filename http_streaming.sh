vlc screen:// :screen-fps=30 :screen-caching=100 --sout '#transcode{vcodec=mp4v,vb=4096,acodec=mpga,ab=256,scale=1,width=1280,height=800}:
http{dst=192.168.1.26,port=1234,mux=ts}'


:sout=#transcode{vcodec=h264,scale=Auto,acodec=mpga,ab=128,channels=2,samplerate=44100}:
http{mux=ffmpeg{mux=flv},dst=:8080/} :sout-keep


vlc screen:// :screen-fps=30 :screen-caching=300  :screen-top=20 :screen-left=10 :screen-width=300 :screen-height=250 --sout '#transcode{vcodec=h264,scale=Auto,acodec=mpga,ab=128,channels=2,samplerate=44100}:http{mux=ffmpeg{mux=flv},dst=:8080/'



Resource
----------------
https://groups.google.com/forum/#!topic/android-developers/67TKWymKjZI