                                                                                                                                                                                                \

##################################                                                                                                                                                                        \
\                                                                                                                                                                                                          
                                                                                                                                                                                                          \


INPUT="rtmp://65.1.42.87:1935/live"

####### Changing below this line is not needed ########                                                                                                                                                   \
\                                                                                                                                                                                                          
                                                                                                                                                                                                          \


if [ -z $1 ]; then
        echo "Give the stream key as the first parameter when running the script"
        exit
fi


echo "Using the following as input stream: " $INPUT


ffmpeg  -f lavfi \
        -i anullsrc \
        -rtsp_transport udp \
        -i $INPUT \
        -tune zerolatency \
        -vcodec mpeg4 \
        -pix_fmt + \
        -c:v copy \
        -c:a aac \
        -f flv rtmp://a.rtmp.youtube.com/live2/$1

