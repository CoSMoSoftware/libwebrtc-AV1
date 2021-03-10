# Run the AppRTCMobile  KITE test

Two computers with Mac are needed. Let us call them A and B.

## On Mac A: 

### Install JDK
https://www.oracle.com/java/technologies/javase-downloads.html  
Select “JDK Download”  
Select installer for your platform  
Launch installer  
Set JAVA_HOME Variable environment.  
https://docs.oracle.com/cd/E19182-01/821-0917/inst_jdk_javahome_t/index.html

### Launch KITE install script 
https://github.com/CoSMoSoftware/libwebrtc-AV1/tree/master/KITE/Engine/install_scripts  
Run installKite.sh

### Install Node.js & Appium
https://nodejs.org/en/  
Run the following command once Node.js is installed. 
``` 
npm install -g appium  
```
Install Appium-For-Mac  
ATTENTION: Make sure that you have Xcode and Xcode Command Line Tools installed on your machine.   
Download the binary for AppiumForMac https://github.com/appium/appium-for-mac/releases  then put it in /Applications.   
After this, you will still need to allow the security permission so that AppiumForMac can control the native apps. Follow the instructions they have in  https://github.com/appium/appium-for-mac . 


### Clone repository KITE-AppRTCMobile-Test
https://github.com/CoSMoSoftware/KITE-AppRTCMobile-Test  
Compile it by running the command in the repository directory  
```
kite_c
```

### Edit KITE-AppRTCMobile-Test/configs/mac.appium.json file.
```
{
  "capabilities": [
    {
      "browserName": "app",
      "app": "/Users/cosmouser/Desktop/appium/AppRTCMobile_av1_m85_release.app", binary path
      "appWorkingDir": "/Users/cosmouser/Desktop/appium/", working directory
      "deviceName": "MAC",
      "maxInstances": 1,
      "platform": "MAC"
    }
  ],
  "configuration": {
    "cleanUpCycle": 2000,
    "timeout": 60000,
    "proxy": "org.openqa.grid.selenium.proxy.DefaultRemoteProxy",
    "url": "http://192.168.1.133:4444/wd/hub", replace 192.168.1.133 by Mac A IP Address
    "maxSession": 1,
    "port": "4728",
    "host": "192.168.1.133", replace 192.168.1.133 by Mac A IP Address
    "register": true,
    "registerCycle": 5000,
    "hubPort": "4444",
    "hubHost": "192.168.1.133" replace 192.168.1.133 by Mac A IP Address
  }
}
```
### Edit KITE-AppRTCMobile-Test/configs/config.json file.
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
"clients": [
{
      "browserName": "app",
      "platform": "MAC",
      "deviceName": "MAC",
      "app": {
        "appName": "/Users/cosmouser/Desktop/appium/AppRTCMobile_av1_m85_release.app",replace path by absolute path of binary on Mac A
        "appWorkingDir": "/Users/cosmouser/Desktop/appium" replace path by absolute path of working directory on Mac A
      }
},
    {
      "browserName": "app",
      "platform": "MAC",
      "deviceName": "MAC",
      "app": {
        "appName": "/Users/cosmouser/Desktop/appium/AppRTCMobile_av1_m85_release.app",replace path by absolute path of binary on Mac B
        "appWorkingDir": "/Users/cosmouser/Desktop/appium" replace path by absolute path of working directory on Mac B
      }
    }
  ]
```
### Run the following commands to run the hub and the node:
In the directory where you installed the drivers:  
```
java -jar ./selenium.jar -role hub
```
In KITE-AppRTCMobile-Test  
```
appium --nodeconfig configs/mac.appium.json --port 4728
```

## On Mac B:

### Install Node.js & Appium
https://nodejs.org/en/  
Run the following command once Node.js is installed.  
```
npm install -g appium  
```
Install Appium-For-Mac  
ATTENTION: Make sure that you have Xcode and Xcode Command Line Tools installed on your machine.   
Download the binary for AppiumForMac https://github.com/appium/appium-for-mac/releases  then put it in /Applications.   
After this, you will still need to allow the security permission so that AppiumForMac can control the native apps. Follow the instructions they have in  https://github.com/appium/appium-for-mac . 

### Create file name mac.appium.json
```
{
  "capabilities": [
    {
      "browserName": "app",
      "app": "/Users/cosmouser/Desktop/appium/AppRTCMobile_av1_m85_release.app", binary path
      "appWorkingDir": "/Users/cosmouser/Desktop/appium/", working directory
      "deviceName": "MAC",
      "maxInstances": 1,
      "platform": "MAC"
    }
  ],
  "configuration": {
    "cleanUpCycle": 2000,
    "timeout": 60000,
    "proxy": "org.openqa.grid.selenium.proxy.DefaultRemoteProxy",
    "url": "http://192.168.1.133:4444/wd/hub", replace 192.168.1.133 by Mac A IP Address
    "maxSession": 1,
    "port": "4728",
    "host": "192.168.1.133", replace 192.168.1.133 by Mac B IP Address
    "register": true,
    "registerCycle": 5000,
    "hubPort": "4444",
    "hubHost": "192.168.1.133" replace 192.168.1.133 by Mac A IP Address
  }
```




### Run the appium node
```
  appium --nodeconfig mac.appium.json --port 4728
```
The machines are now all set. To run the test, run the following command in the KITE-AppRTCMobile-Test directory on Mac A:
```
  kite_r configs\config.json
```