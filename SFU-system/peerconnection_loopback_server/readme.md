# Loopback Server

The loopback server is provided in this directory as a docker in the file `Dockerfile`.

Installation and running of the loopback server requires access to the following github repositories:
- public repository `CoSMoSoftware/media-server-node`
- private repository  `CoSMoSoftware/POC-medooze-multiopus-loopback-web-app`

To get access to these repositories during installation of the docker file, you need:
1. SSH key associated with your github account
2. Finger print of github must be in your file `~/.ssh/lnown_hosts`

## Run Dockerfile

Note: On Windows, use a Powershell command line terminal.

    // Move to directory where you put file “Dockerfile”
    // Copy github SSH keys (assuming they are stored in files named id_rsa)
    cp ~/.ssh/id_rsa .
    cp ~/.ssh/id_rsa.pub .
    cp ~/.ssh/known_hosts .
    docker build . -t multiopus-webapp

On Windows only:

    docker run -d -p "10000-10100:10000-10100/udp" -p 8084:8084 -p 8888:8888 --name webapp multiopus-webapp <your_ip_address>

On Linux only:

    docker run -d --network host --name webapp multiopus-webapp <your_ip_address>

## Start loopback server

- Launch Google Chrome
- Open URL https://your_ip_address:8084/

[Chrome not secure](http://ludo17.free.fr/av1_svc_demo/chrome_not_secure.png)

Click on button `Advanced`.

[Chrome not secure 2](http://ludo17.free.fr/av1_svc_demo/chrome_not_secure2.png)

Click on text `Proceed to <your_ip_address> (unsafe)`

[Chrome list of demos](http://ludo17.free.fr/av1_svc_demo/chrome_demos.png)


- Click on "AV1 SVC"

[Chrome AV1 SVC demo](http://ludo17.free.fr/av1_svc_demo/chrome_av1_svc_demo.png)
