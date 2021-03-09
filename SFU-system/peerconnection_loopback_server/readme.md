# Loopback Server

The loopback server is provided in this directory as a docker in the file `Dockerfile`.

## Run Dockerfile

    // Move to directory where you put file “Dockerfile”
    docker build . -t medooze-server

On Windows or Mac:

    docker run -d -p "10000-10100:10000-10100/udp" -p 8084:8084 -p 8888:8888 --name medooze medooze-server <your_ip_address>

On Linux only:

    docker run -d --network host --name medooze medooze-server <your_ip_address>

## Start loopback server

- Launch Google Chrome
- Open URL https://your_ip_address:8084/

![Chrome not secure](http://ludo17.free.fr/av1_svc_demo/chrome_not_secure.png)

Click on button `Advanced`.

![Chrome not secure 2](http://ludo17.free.fr/av1_svc_demo/chrome_not_secure2.png)

Click on text `Proceed to <your_ip_address> (unsafe)`

![Chrome list of demos](http://ludo17.free.fr/av1_svc_demo/chrome_demos.png)


- Click on "AV1 SVC"

![Chrome AV1 SVC demo](http://ludo17.free.fr/av1_svc_demo/chrome_av1_svc_demo.png)
