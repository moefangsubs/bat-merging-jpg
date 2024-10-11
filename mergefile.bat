@echo off
setlocal enabledelayedexpansion

REM Specify the maximum number of images to merge per group
set max_images=50

REM Specify the image path (the directory where the batch file is located)
set "image_path=%~dp0"

REM Initialize variables
set /a count=1
set /a file_count=1

REM Create a list.txt file to store the list of images
echo. > "%image_path%list.txt"

REM Loop through the images in the folder and ensure correct numeric order
for /f "tokens=*" %%A in ('dir /b /on "%image_path%*.jpg"') do (
    REM Add the image file path to list.txt
    echo file '%%~fA' >> "%image_path%list.txt"

    REM If the count reaches the maximum number of images (50), merge them
    if !count! equ %max_images% (
        REM Merge images vertically using ImageMagick
        magick convert @"%image_path%list.txt" -append "%image_path%x!file_count!.jpg" 2>nul

        REM Remove the original images after merging
        for /l %%I in (1,1,!max_images!) do (
            del "%%~fA" 2>nul
        )

        REM Reset variables for the next batch
        set /a count=1
        set /a file_count+=1

        REM Clear list.txt for the next batch
        echo. > "%image_path%list.txt"

        REM Show loading bar (optional, remove this if unnecessary)
        call :PrintLoadingBar !file_count!
    ) else (
        set /a count+=1
    )
)

REM If there are leftover images, merge them
if exist "%image_path%list.txt" (
    magick convert @"%image_path%list.txt" -append "%image_path%x!file_count!.jpg" 2>nul

    REM Remove the remaining images
    for /l %%I in (1,1,!count!) do (
        del "%%~fA" 2>nul
    )

    REM Delete the list.txt after processing
    del "%image_path%list.txt"

    REM Show loading bar for the last file
    call :PrintLoadingBar !file_count!
)

REM Optional: Clean up the directory by deleting all images except the merged ones (starting with x)
for %%A in ("%image_path%*.jpg") do (
    set "filename=%%~nA"
    if /i "!filename:~0,1!" neq "x" (
        del "%%~fA"
    )
)

REM Show completion message
cls
color 5f
echo. ____________________________________________________________
echo. ^|                                                      ^|
echo. ^|      FILES MERGED SUCCESSFULLY!                       ^|
echo. ^|      PRESS ANY KEY TO EXIT                            ^|
echo. ^|______________________________________________________^|
echo.
pause>nul
exit /b

:PrintLoadingBar
setlocal enabledelayedexpansion
set "bar="
for /l %%I in (1,1,10) do (
    if %%I leq %1 (
        set "bar=!bar!#"
    ) else (
        set "bar=!bar!"
    )
)
echo [!bar!] %1/10
exit /b
