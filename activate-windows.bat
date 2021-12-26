@echo off
goto check_Permissions

:check_Permissions
    echo Administrative permissions required. Detecting permissions...

    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo Success: Administrative permissions confirmed.
		echo Starting Activate Windows 10!
		cd C:\Windows\system32
		slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
		slmgr /skms kms8.msguides.com
		slmgr /ato
		echo Your Windows has officially Activated!
    ) else (
        echo Error: Please Run on administrator mode!
    )
	pause >nul
