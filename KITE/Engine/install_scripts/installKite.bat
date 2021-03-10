@echo off
if not defined JAVA_HOME (
    echo Error: JAVA_HOME is not set. Please manually install Java JDK 8. https://www.oracle.com/java/technologies/javase/javase-jdk8-downloads.html.
    echo It is required to define JAVA_HOME as a environment variable. https://docs.oracle.com/cd/E19182-01/820-7851/inst_cli_jdk_javahome_t/
    exit /b
)

where git
if %ERRORLEVEL% NEQ 0 (
    echo [Net.ServicePointManager]::SecurityProtocol = 'TLS11','TLS12','ssl3' >> installGit.ps1
    echo Invoke-WebRequest -OutFile git.exe https://github.com/git-for-windows/git/releases/download/v2.30.0.windows.2/Git-2.30.0.2-64-bit.exe >> installGit.ps1
    Powershell.exe -executionpolicy remotesigned -File installGit.ps1
    del /f installGit.ps1
    start /wait git.exe
    del /f git.exe
    call refreshEnv.cmd
)
where mvn
if %ERRORLEVEL% NEQ 0 (
    set MAVEN_VERSION=3.6.3
    rem download Maven with the specified version from the gridConfig.bat
    echo [Net.ServicePointManager]::SecurityProtocol = 'TLS11','TLS12','ssl3' >> installMaven.ps1
    echo Invoke-WebRequest -OutFile maven.zip https://downloads.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.zip >> installMaven.ps1
    rem unzip the downloaded files
    Powershell.exe -executionpolicy remotesigned -File installMaven.ps1
    del /f installMaven.ps1
    jar xf maven.zip
    move apache-maven-3.6.3 %USERPROFILE%
    del /f maven.zip
    setx MAVEN_HOME "%USERPROFILE%\apache-maven-3.6.3"
    for /F "tokens=2* delims= " %%f IN ('reg query HKCU\Environment /v PATH ^| findstr /i path') do set OLD_SYSTEM_PATH=%%g
    set NEW_PATH=%USERPROFILE%\apache-maven-3.6.3\bin
    echo %OLD_SYSTEM_PATH% | FINDSTR /C:"%NEW_PATH%" >nul & IF ERRORLEVEL 1 (setx PATH "%OLD_SYSTEM_PATH%;%NEW_PATH%") else (ECHO %NEW_PATH% was already present)
    timeout /t 2 >nul
    set Path=%PATH%;%NEW_PATH%
    call refreshEnv.cmd
)
where kite_c
    if %ERRORLEVEL% NEQ 0 (
    git clone https://github.com/webrtc/kite
    cd kite
    set KITE_HOME=%cd%
    setx KITE_HOME "%KITE_HOME%"
    for /F "tokens=2* delims= " %%f IN ('reg query HKCU\Environment /v PATH ^| findstr /i path') do set OLD_SYSTEM_PATH=%%g
    set NEW_PATH=%KITE_HOME%\scripts\windows\path
    echo %OLD_SYSTEM_PATH% | FINDSTR /C:"%NEW_PATH%" >nul & IF ERRORLEVEL 1 (setx PATH "%OLD_SYSTEM_PATH%;%NEW_PATH%") else (ECHO %NEW_PATH% was already present)
    timeout /t 2 >nul
    set Path=%PATH%;%NEW_PATH%
    mvn install
    cd ..
    call refreshEnv.cmd
)
