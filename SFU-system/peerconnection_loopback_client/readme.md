# Run the peer connection loopback KITE test

One single computer with Windows is needed. Let us call it A.

On Windows A: JDK and Docker must be installed.

## Install JDK
https://www.oracle.com/java/technologies/javase-downloads.html  
Select “JDK Download”  
Select installer for your platform  
Launch installer  
Set JAVA_HOME Variable environment.  
https://docs.oracle.com/cd/E19182-01/821-0917/inst_jdk_javahome_t/index.html  

## Install Docker
https://www.docker.com/products/docker-desktop  
Select installer for your platform  
Launch installer  
Install Medooze container  
Docker file here:  
https://github.com/CoSMoSoftware/libwebrtc-AV1/tree/master/SFU-system/peerconnection_loopback_server  

```
// Move to directory where you put file “Dockerfile”  
docker build . -t medooze-server
```

On Windows only (this is one single command line):  
```
docker run -d -p "10000-10100:10000-10100/udp" -p 8084:8084 -p 8888:8888 --name medooze medooze-server <your_ip_address> 
```

## Launch KITE install script 
https://github.com/CoSMoSoftware/libwebrtc-AV1/tree/master/KITE/Engine/install_scripts  
Run installKite.bat

## Launch Node install script. 
https://github.com/CoSMoSoftware/libwebrtc-AV1/tree/master/KITE/Engine/install_scripts  
Run installDrivers.bat  
Developer Mode needs to be manually enabled https://docs.microsoft.com/en-us/windows/apps/get-started/enable-your-device-for-development  

## Clone repository KITE-PeerConnection-Medooze-Test
https://github.com/CoSMoSoftware/KITE-PeerConnection-Medooze-Test  

Compile it by running the command in the repository directory  
```
kite_c
```

## Edit KITE-PeerConnection-Medooze-Test/configs/windows.appium.json file.
```
{
  "capabilities": [
    {
      "browserName": "app",
      "app": "C:\\Appium\\peerconnection\\av1\\peerconnection_client.exe", binary path
      "appWorkingDir": "C:\\Appium\\peerconnection\\av1", working directory
      "appArguments": "--scalability_mode=L3T3  --server=sgmedooze.cosmosoftware.io --autoconnect=true  --force_fieldtrials=WebRTC-DependencyDescriptorAdvertised/Enabled/", replace sgmedooze.cosmosoftware.io with Windows A IP Address
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

## Edit KITE-PeerConnection-Medooze-Test/configs/config.json file.
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
      "platform": "WINDOWS",
      "deviceName": "WINDOWS",
      "app": {
        "appName": "C:\\Appium\\peerconnection\\av1\\peerconnection_client.exe", replace path by absolute path of binary on Windows A
        "appWorkingDir": "C:\\Appium\\peerconnection\\av1" replace path by absolute path of working directory on Windows A
      },
      "extraCapabilities": {
        "appArguments": "--scalability_mode=L3T3  --server=sgmedooze.cosmosoftware.io --autoconnect=true  --force_fieldtrials=WebRTC-DependencyDescriptorAdvertised/Enabled/"replace sgmedooze.cosmosoftware.io with Windows A IP Address
      }
    }
]
```
## Run the following commands to run the hub and the nodes:
In the directory where you installed the drivers:
```
java -jar ./selenium.jar -role hub

java -Dwebdriver.chrome.driver=grid/chromedriver.exe -jar ./selenium.jar -role node -maxSession 10 -port 5555 -host windows_a_ip -hub http://windows_a_ip:4444/grid/register -browser browserName=chrome,version=89,platform=WINDOWS,maxInstances=10
```
In KITE-PeerConnection-Medooze-Test
```
appium --nodeconfig configs\windows.appium.json --port 4728
```
	
The machines is now all set. To run the test, run the following command in the KITE-PeerConnection-Medooze-Test directory on Windows A:
```
  kite_r configs\config.json
```