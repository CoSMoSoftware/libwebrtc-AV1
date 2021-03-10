@echo off
mkdir grid
cd grid 
Powershell.exe -executionpolicy remotesigned Invoke-WebRequest -OutFile selenium.jar https://selenium-release.storage.googleapis.com/3.141/selenium-server-standalone-3.141.59.jar

rem download the drivers 
echo [Net.ServicePointManager]::SecurityProtocol = 'TLS11','TLS12','ssl3' >> installDrivers.ps1
echo Invoke-WebRequest -OutFile chromedriver.zip https://chromedriver.storage.googleapis.com/89.0.4389.23/chromedriver_win32.zip >> installDrivers.ps1

rem unzip the downloaded files 
Powershell.exe -executionpolicy remotesigned -File  installDrivers.ps1
Powershell.exe -NoP -NonI -Command "Expand-Archive 'chromedriver.zip' '.'" 

rem delete the zip filed
del /f installDrivers.ps1
del /f chromedriver.zip
cd ..

where npm
if %ERRORLEVEL% NEQ 0 (
    echo [Net.ServicePointManager]::SecurityProtocol = 'TLS11','TLS12','ssl3' >> installNpm.ps1
    echo Invoke-WebRequest -OutFile node.msi https://nodejs.org/dist/v14.15.4/node-v14.15.4-x64.msi >> installNpm.ps1
    Powershell.exe -executionpolicy remotesigned -File installNpm.ps1
    start /wait node.msi
    del /f node.msi
    del /f installNpm.ps1
    call refreshEnv.cmd
)
where appium
    if %ERRORLEVEL% NEQ 0 (
    npm install -g appium
    echo [Net.ServicePointManager]::SecurityProtocol = 'TLS11','TLS12','ssl3' >> installWinDriver.ps1
    echo Invoke-WebRequest -OutFile windriver.msi https://github.com/microsoft/WinAppDriver/releases/download/v1.2.1/WindowsApplicationDriver_1.2.1.msi >> installWinDriver.ps1
    Powershell.exe -executionpolicy remotesigned -File installWinDriver.ps1
    start /wait windriver.msi
    del /f windriver.msi
    del /f installWinDriver.ps1
    call refreshEnv.cmd
)


