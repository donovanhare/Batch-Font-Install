@echo off
setlocal EnableDelayedExpansion
set fonts[0]=CCW Cursive Arrow 4
set fonts[1]=CCW Cursive Dotted 4
set fonts[2]=CCW Cursive Lined 4
set fonts[3]=CCW Cursive Outline 4
set fonts[4]=CCW Cursive Solid Lined 4
set fonts[5]=CCW Cursive Writing 4
set fonts[6]=XCCW Joined 4a
set fonts[7]=XCCW Joined 4b
set fonts[8]=XCCW Joined Dotted 4a
set fonts[9]=XCCW Joined Dotted 4b
set fonts[10]=XCCW Joined Lined 4a
set fonts[11]=XCCW Joined Lined 4b

for /l %%n in (0,1,11) do (

	set path1=%Temp%\Fonts\!fonts[%%n]!.ttf 
	set path2=%SystemRoot%\Fonts\!fonts[%%n]!.ttf
	set path3=%SystemRoot%\Fonts\
	set fontname=!fonts[%%n]!

	if exist !path1! (

		if exist !path2! (
	    	echo Font detected on target machine. Deleting...
	    	del "!path2!"
	    	echo Copying font from !path1! to !path3!
	   		echo !fontname!
	   		xcopy /y "%Temp%\Fonts\!fonts[%%n]!.ttf" "%SystemRoot%\Fonts\"
	   		reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "!fontname! TrueType" /t REG_SZ /d "!fontname!.ttf" /f
	   		echo Done
	   	) else (
	   		echo Copying font from !path1! to !path3!
	   		echo !fontname!
	   		xcopy /y "%Temp%\Fonts\!fonts[%%n]!.ttf" "%SystemRoot%\Fonts\"
	   		reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "!fontname! TrueType" /t REG_SZ /d "!fontname!.ttf" /f
	   		echo Done
	   	)

	) else (
	    echo File !path1! not found.
	)
	

)
pause

