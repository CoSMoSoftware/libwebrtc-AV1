# KITE

## A. Prerequisites

You will need Git, JDK 8 and Maven. 

#### Git

You can download it from:  
[Git](https://git-scm.com/downloads)  

#### Java Development Kit 8

You can download it from:  
[JDK 8](https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)  
Set JAVA_HOME:
* On Windows: 
  * Right click My Computer and select Properties.
  * On the Advanced tab, select Environment Variables, and then add a new variable JAVA_HOME to point to where the JDK software is located, for example, C:\Program Files\Java\jdk1.8.0_271.
  * Edit the variable PATH and add %JAVA_HOME%\bin
* On UNIX System: 
  * For Korn and bash shells, run the following commands:
    * export JAVA_HOME=jdk-install-dir (for example /usr/lib/jvm/openjdk-8; you can use the command readlink -f $(which java) to help you find the folder)
    * export PATH=$JAVA_HOME/bin:$PATH
  * For the bourne shell, run the following commands:
    * JAVA_HOME=jdk-install-dir (for example /usr/lib/jvm/openjdk-8; you can use the command readlink -f $(which java) to help you find the folder)
    * export JAVA_HOME
    * PATH=$JAVA_HOME/bin:$PATH
    * export PATH
  * For the C shell, run the following commands:
    * setenv JAVA_HOME jdk-install-dir (for example /usr/lib/jvm/openjdk-8; you can use the command readlink -f $(which java) to help you find the folder)
    * setenv PATH $JAVA_HOME/bin:$PATH
    * export PATH=$JAVA_HOME/bin:$PATH
* On Mac: 
  * sudo vi ~/.profile
  * Add the following line
    * export JAVA_HOME=$(/usr/libexec/java_home)
  * Save the file by tapping on ESC button on the keyboard and then :wq. This will save the file and will quite.
  * source ~/.profile

##### Maven installation
 
 If you would like to use our script to install Maven and KITE, you can skip it and instructions B. aswell for now.
 
Alternatively, if you are familiar with setting up Maven and configuring the PATH and environment variables, you can download [Maven](https://maven.apache.org/download.cgi?Preferred=ftp://mirror.reverse.net/pub/apache/) from  
https://maven.apache.org/download.cgi

The following guides could help you:
* On Windows: https://www.mkyong.com/maven/how-to-install-maven-in-windows/
* On Ubuntu: https://www.mkyong.com/maven/how-to-install-maven-in-ubuntu/
* On Mac: https://www.mkyong.com/maven/install-maven-on-mac-osx/

To verify your setup, in a new command prompt or shell terminal, type:
``` 
mvn -version
```
Expected output (for example on Windows 10):
```
Apache Maven 3.6.1
Maven home: C:\Program Files\Maven\apache-maven-3.6.1\bin\..
Java version: 1.8.0_191, vendor: Oracle Corporation
Java home: C:\Program Files\Java\jdk1.8.0_191\jre
Default locale: en_US, platform encoding: Cp1252
OS name: "windows 10", version: "10.0", arch: "amd64", family: "windows"
```

Install your favorite Java IDE. We recommend [IntelliJ IDEA Community](https://www.jetbrains.com/idea/download) but you can use Eclipe or any other IDE if you prefer.
&nbsp;    

If you are on Mac and are using zsh, please make sure to add the following line add the end of your `~/.zshrc` file:
``` 
source .bash_profile
```

## B. Installing KITE

### 1. Automated
A script to install KITE is provided for Windows & MacOS in install_scripts folder.
For Windows:
```
installKite.bat
```

For MacOS:
```
chmod +x ./installKite.sh
./installKite.sh
```

If you didn't install maven, it will first install it, then clone the KITE git repository and compile it.

### 2. Manual

1. Clone the KITE repo into a folder __without any space__, for example under `\GitHub\`:  
     
    ```
    mkdir GitHub
    cd GitHub
    git clone https://github.com/webrtc/KITE.git
    cd KITE
    ```

2. Maven installation

    If you haven't installed Maven yet, you can install it using the installMaven script.
 
    On Windows, open a Command Prompt window and enter the following commands:

    ```
    scripts/windows/installMaven.bat
    ```

    On Linux, open a terminal and enter the following commands:
    ```
    chmod -R +x scripts/linux
    scripts/linux/installMaven.sh
    ```     
    
    On Mac, open a terminal and enter the following commands:
    ```
    chmod -R +x scripts/mac
    scripts/mac/installMaven.sh
    ```
    
3. Configure __KITE__  


    This will set KITE_HOME environment variable and add utility scripts to your path.  

    3.1 On Windows, open a Command Prompt window and enter the following commands:
    ```
    configure.bat
    ```

    3.2 On Linux, open a terminal and enter the following commands:
    ```
    chmod +x configureLinux.sh
    ./configureLinux.sh
    ```     
    
    3.3 On Mac, open a terminal and enter the following commands:
    ```
    chmod +x configureMac.sh 
    ./configureMac.sh
    ```
    
    During this step, you will be prompt to setup the local grid. This is an interactive setup. 
    It is important to configure the Firefox and Chrome versions according to the versions installed on your computer.  
    If Chrome and/or Firefox are not installed, this script will automatically download and install the latest stable releases. 
          
    To check the browser versions:  
    __1. Chrome__  
    Open Chrome and enter <a href="chrome://settings/help" target="_blank">chrome://settings/help</a> into the address bar.
       
    __2. Firefox__  
    Open Firefox, top right menu, then select Help, then About Firefox. You can also find out the latest version
     at [www.mozilla.org/en-US/firefox/releases/](https://www.mozilla.org/en-US/firefox/releases/).
    
    Different browser versions require a different ChromeDriver (to control Chrome) and a different GeckoDriver (to control Firefox).
    You will need to find out what are the corresponding driver versions. Please visit the following two pages:
    * http://chromedriver.chromium.org/downloads
    * https://github.com/mozilla/geckodriver/releases  
 
    By default, the local grid setup script is configured for __Chrome__ version __87__ and __Firefox__ version __83__. 
    If these are the versions installed on your computer, you can safely use the default settings.
    Otherwise, you will need to edit the following settings when prompt to do so:  
    
    ```
    CHROME_VERSION=87
    FIREFOX_VERSION=83
    CHROMEDRIVER_VERSION=87.0.4280.88
    GECKO_VERSION=v0.26.0
    ```
    
    __Note:__ Please input only the major (i.e. 83 or 77) for the browser versions, but the full version with the minor (i.e. 87.0.4280.88 or v0.26.0) for the driver versions.     
   The latest version of ChromeDriver is available at: https://chromedriver.storage.googleapis.com/LATEST_RELEASE
   More details are available in the [local grid setup guide](scripts/README.md).
    
    __3. Safari__  
    Safari is installed by default on MacOS, there is no need to download anything. You will only need to enable the 'Allow Remote Automation' option in Safari's Developer menu so it can be automated by KITE for testing.
    
    
4. Compile 

    
__On Windows:__  
    Just type `kite_c` (which will execute `mvn clean install -DskipTests`). 
    
    ```
    cd %KITE_HOME%
    kite_c
    ```

If you are within a test folder, for example in KITE-AppRTC-Test, you can type __`kite_c`__ to compile the test module
only or __`kite_c all`__ to recompile the entire project:

    ```
    cd %KITE_HOME%\KITE-AppRTC-Test  
    kite_c all
    ```  
__On Linux/Mac:__  
Just type `kite_c` (which will execute `mvn clean install -DskipTests`).
    ```
    cd $KITE_HOME
    kite_c
    ```
If you are within a test folder, for example in KITE-AppRTC-Test, you can type __`kite_c`__ to compile the test module
 only or __`kite_c all`__ to recompile the entire project:  

    ```
    cd $KITE_HOME/KITE-AppRTC-Test
    kite_c all
    ```
    
## C. Install the local Grid

Selenium Grid has a Hub and Node Architecture.

The Hub  

    The hub is the central point where you load your tests into.  
    There should only be one hub in a grid.  
    The hub is launched only on a single machine, say, a computer whose O.S is Windows 7 and whose browser is IE.  
    The machine containing the hub is where the tests will be run, but you will see the browser being automated on the node.  
The Nodes  

    Nodes are the Selenium instances that will execute the tests that you loaded on the hub.  
    There can be one or more nodes in a grid.  
    Nodes can be launched on multiple machines with different platforms and browsers.  
    The machines running the nodes need not be the same platform as that of the hub.  

This guide will assist you in setting up a local Selenium Grid on your computer with a Selenium Hub, one Selenium Node for Chrome, and one Selenium Node for any native app.
KITE does not currently support Linux native apps, and thus this guide is targeted to both Windows & Mac.

### 1. Automated (Windows 10 only)

A script is provided to install requirements for the local grid.
```
installDrivers.bat
```

It will download the Selenium Standalone Server, Node.js and Appium.  
Finally, it will download and install WinAppDriver, a service allowing the control of native app for Windows.  
Please note that you will have to enable [Developer Mode](https://docs.microsoft.com/en-us/windows/apps/get-started/enable-your-device-for-development) in Windows Settings.


### 2. Manual (Windows & Mac)

Download Selenium Standalone Server from:  
https://www.seleniumhq.org/download/ And rename the file to selenium.jar.

#### a. Hub 

To run the hub, please run the following command:
```
java -jar ./selenium.jar -role hub
```

#### b. Chrome node

If you don't have chrome installed, you can find it [here](https://www.google.com/chrome/).  
Download the [chromedriver](https://chromedriver.chromium.org/downloads) corresponding to your chrome version.  
To run the chrome node, please run the following command:  
Windows  
```
java -Dwebdriver.chrome.driver=./chromedriver.exe -jar ./selenium.jar -role node -maxSession 10 -port 5555 -host NODE_IP_ADDRESS -hub http://HUB_IP_ADDRESS:4444/grid/register -browser browserName=chrome,version=CHROME_VERSION,platform=WINDOWS,maxInstances=10 --debug 
```

Mac
```
java -Dwebdriver.chrome.driver=./chromedriver.exe -jar ./selenium.jar -role node -maxSession 10 -port 5555 -host NODE_IP_ADDRESS -hub http://HUB_IP_ADDRESS:4444/grid/register -browser browserName=chrome,version=CHROME_VERSION,platform=MAC,maxInstances=10 --debug 
```

#### c. Native app node

Install [Node.js](https://nodejs.org/en/).
Run the following command to install appium:
```
npm install -g appium
```

Windows:
    Installing Windows Application Driver:  
    Download Windows Application Driver installer from https://github.com/Microsoft/WinAppDriver/releases  
    Run the installer on a Windows 10 machine where your application under test is installed and will be tested  
    Enable [Developer Mode](https://docs.microsoft.com/en-us/windows/apps/get-started/enable-your-device-for-development) in Windows settings  

Mac:  
    ATTENTION: Make sure that you have Xcode and Xcode Command Line Tools installed on your machine.  
    Download the binary for AppiumForMac [here](https://github.com/appium/appium-for-mac/releases), then put it in /Applications.  
    After this, you will still need to allow the security permission so that AppiumForMac can control the native apps. Follow the instructions they have in [here](https://github.com/appium/appium-for-mac).  

For the provided tests, a sample config file is provided to run the appium nodes. You will still have to modify them with your own parameters.  
For example:
```
{
  "capabilities": [
    {
      "browserName": "app",
      "app": "C:\\Appium\\peerconnection\\peerconnection_client_av1.exe", <---- This will need to be changed, this is the path to the binary
      "appWorkingDir": "C:\\Appium\\peerconnection\\", <---- This will need to be changed, this is the path to the working directory
      "deviceName": "WINDOWS",
      "maxInstances": 1,
      "platform": "WINDOWS"
    }
  ],
  "configuration": {
    "cleanUpCycle": 2000,
    "timeout": 60000,
    "proxy": "org.openqa.grid.selenium.proxy.DefaultRemoteProxy",
    "url": "http://192.168.1.133:4444/wd/hub", <---- This will need to be changed, this is the url of the hub
    "maxSession": 1,
    "port": "4728",
    "host": "192.168.1.133", <---- This will need to be changed, this is the node ip address
    "register": true,
    "registerCycle": 5000,
    "hubPort": "4444",
    "hubHost": "192.168.1.133" <---- This will need to be changed, this is the hub ip address
  }
}
```
To run the node:
```
appium --nodeconfig "C:\Appium\windows.appium.json" --port 4728
```