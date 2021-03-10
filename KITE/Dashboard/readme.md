# KITE Dashboard

This docker image contains a dashboard and a FTP server that can be used to automatically upload kite tests results after each test. 

## Build

  docker build . -t kite

Linux: If you have an error message about file `/var/run/docker.sock` similar to this:

    Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Post http://%2Fvar%2Frun%2Fdocker.sock/v1.24/build?buildargs=%7B%7D&cachefrom=%5B%5D&cgroupparent=&cpuperiod=0&cpuquota=0&cpusetcpus=&cpusetmems=&cpushares=0&dockerfile=Dockerfile&labels=%7B%7D&memory=0&memswap=0&networkmode=default&rm=1&shmsize=0&t=medooze-server&target=&ulimits=null&version=1: dial unix /var/run/docker.sock: connect: permission denied

then run this command to solve the problem (replace `LOGIN_NAME` by your login name):

    sudo setfacl --modify user:LOGIN_NAME:rw /var/run/docker.sock

and run `docker build` again.

Windows and Mac:

    docker run -d -p 10200-10300:10200-10300 -p 2221:2221 -p 4442-4444:4442-4444 -p 8080:8080 -p 80:80 --name kite kite

Linux only:

    docker run -d --network host --name kite kite

## Use

In the config files of any KITE test, you can add these parameters.
```
  "callbackUrl": "localhost",
  "callbackPort": 2221,
  "callbackUsername" : "user",
  "callbackPassword": "password",
```
The results will be available at http://localhost:8080/kdash


If you want to upload to the provided dashboard for av1, here are the parameters.
```
  "callbackUrl": "kdash.av1.cosmosoftware.io",
  "callbackPort": 2221,
  "callbackUsername" : "cosmouser",
  "callbackPassword": "CSmu1;'_",
```
The results will be available at https://kdash.av1.cosmosoftware.io
