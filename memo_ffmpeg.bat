@echo off
rem ffmpeg -framerate 12 -i camera2_%%02d.bmp video.avi
rem cd out
rem xaos -render ..\anim.xaf -size 1920x1080 -antialiasing -renderframerate 24 -basename xaos_tst_
rem cd ..
rem (for %%x in (out/*.png)do echo file 'out/%%~x') > input.txt
ffmpeg -r 24 -f concat -i input.txt -c:v libx264 -r 24 -pix_fmt yuv420p video.mpg
ffmpeg -y -i video.mpg -crf 24.0 -vcodec libx264 -acodec libvo_aacenc -ar 48000 -b:a 160k -coder 1 -rc_lookahead 60 -threads 0 video.mp4
