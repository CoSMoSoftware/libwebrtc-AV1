# Run the peer connection P2P KITE test

Two computers with Windows are needed. Let us call them A and B.

## On Windows A

### Install JDK
https://www.oracle.com/java/technologies/javase-downloads.html  
Select “JDK Download”  
Select installer for your platform  
Launch installer  
Set JAVA_HOME Variable environment.  
https://docs.oracle.com/cd/E19182-01/821-0917/inst_jdk_javahome_t/index.html  

### Launch KITE install script 
https://github.com/CoSMoSoftware/libwebrtc-AV1/tree/master/KITE/Engine/install_scripts  
Run installKite.bat

### Launch Node install script. 
https://github.com/CoSMoSoftware/libwebrtc-AV1/tree/master/KITE/Engine/install_scripts  
Run installDrivers.bat  
Developer Mode needs to be manually enabled https://docs.microsoft.com/en-us/windows/apps/get-started/enable-your-device-for-development  

### Clone repository KITE-AV1-PeerConnection-Test
https://github.com/CoSMoSoftware/KITE-AV1-PeerConnection-Test  
Compile it by running the command in the repository directory  
```
kite_c
```
### Edit KITE-PeerConnection-Test/configs/windows.appium.json file.
```
{
  "capabilities": [
    {
      "browserName": "app",
      "app": "C:\\Appium\\peerconnection\\peerconnection_client_av1.exe", binary path
      "appWorkingDir": "C:\\Appium\\peerconnection\\", working directory
      "deviceName": "WINDOWS",
      "maxInstances": 1,
      "platform": "WINDOWS"
    }
  ],
  "configuration": {
    "cleanUpCycle": 2000,
    "timeout": 60000,
    "proxy": "org.openqa.grid.selenium.proxy.DefaultRemoteProxy",
    "url": "http://192.168.1.133:4444/wd/hub", replace 192.168.1.133 by Windows A IP Address
    "maxSession": 1,
    "port": "4728",
    "host": "192.168.1.133", replace 192.168.1.133 by Windows A IP Address
    "register": true,
    "registerCycle": 5000,
    "hubPort": "4444",
    "hubHost": "192.168.1.133" replace 192.168.1.133 by Windows A IP Address
  }
}
```
### Edit KITE-PeerConnection-Test/configs/config.json file.
There are few parameters to change.
```
 "grids": [
    {
      "type": "local",
      "url": "http://localhost:4444/wd/hub"  replace localhost by Windows A IP Address
    }
  ]
```
```
"payload": {
        "url": "192.168.1.1"  replace 192.168.1.1 by Windows A IP Address
}
```

```
 "clients": [
{
      "browserName": "app",
      "platform": "WINDOWS",
      "deviceName": "WINDOWS",
      "app": {
        "appName": "C:\\Appium\\peerconnection\\peerconnection_client.exe", replace path by absolute path of binary on Windows A
        "appWorkingDir": "C:\\Appium\\peerconnection\\" replace path by absolute path of working directory on Windows A
      }
},
{
      "browserName": "app",
      "platform": "WINDOWS",
      "deviceName": "WINDOWS",
      "app": {
        "appName": "C:\\Appium\\peerconnection\\peerconnection_client.exe", replace path by absolute path of binary on Windows B
        "appWorkingDir": "C:\\Appium\\peerconnection\\" replace path by absolute path of working directory on Windows B
      }
}
  ]
```

### Manually launch peerconnection_server.exe

### Run the following commands to run the hub and the node:
In the directory where you installed the drivers:
```
java -jar ./selenium.jar -role hub
```
In KITE-PeerConnection-Test
```
appium --nodeconfig configs\windows.appium.json --port 4728
```
## On Windows B:

### Launch Node install script.
https://github.com/CoSMoSoftware/libwebrtc-AV1/tree/master/KITE/Engine/install_scripts  
Run installDriver.bat  
Developer Mode needs to be manually enabled https://docs.microsoft.com/en-us/windows/apps/get-started/enable-your-device-for-development  

### Create file name windows.appium.json
```
{
  "capabilities": [
    {
      "browserName": "app",
      "app": "C:\\Appium\\peerconnection\\peerconnection_client_av1.exe", binary path
      "appWorkingDir": "C:\\Appium\\peerconnection\\", working directory
      "deviceName": "WINDOWS",
      "maxInstances": 1,
      "platform": "WINDOWS"
    }
  ],
  "configuration": {
    "cleanUpCycle": 2000,
    "timeout": 60000,
    "proxy": "org.openqa.grid.selenium.proxy.DefaultRemoteProxy",
    "url": "http://192.168.1.133:4444/wd/hub", replace 192.168.1.133 by Windows A IP Address
    "maxSession": 1,
    "port": "4728",
    "host": "192.168.1.133", replace 192.168.1.133 by Windows B IP Address
    "register": true,
    "registerCycle": 5000,
    "hubPort": "4444",
    "hubHost": "192.168.1.133" replace 192.168.1.133 by Windows A IP Address
  }
}
```
### Run the appium node
```
  appium --nodeconfig windows.appium.json --port 4728
```
The machines are now all set. To run the test, run the following command in the KITE-AV1-PeerConnection-Test directory on Windows A:
```
  kite_r configs\config.json
```