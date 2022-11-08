@echo off
goto check_Permissions

:check_Permissions
    echo Administrative permissions required. Detecting permissions...

    net session >nul 2>&1
    if %errorLevel% == 0 (
		for /f "skip=1 tokens=2 delims==" %%A in ('wmic /namespace:\\root\wmi PATH MSAcpi_ThermalZoneTemperature get CurrentTemperature /value') do set /a "HunDegCel=(%%~A*10)-27315"
		echo %HunDegCel:~0,-2%.%HunDegCel:~-2% Degrees Celsius
    ) else (
        echo Error: Please Run on administrator mode!
    )
	pause >nul
