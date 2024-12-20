@echo off
for %%a in (*.mkv) do (
    set "video=%%a"
    set "subtitle=%%~na.srt"
    if exist "%%~na.srt" (
        ffmpeg -i "%%a" -i "%%~na.srt" -map 0:v:0 -map 0:a:0 -map 1:s:0 -c:v copy -c:a copy -strict unofficial -c:s mov_text "%%~na_subbed.mp4"
        echo Merged subtitles into %%~na.mp4
    ) else (
        echo No subtitles found for %%~na.mp4
    )
)
pause