# Peerconnection Client and Server

libwebrtc provides for Windows and Linux platforms a simple tool called `peerconnection_client` able to launch a video call between two peers through WebRTC.

In `src`, we provide the information to retrieve the source code of libwebrtc, a patch to enable AV1 and make it the default and only availabke codec, and instructions for applying the patch and compile libwebrtc.

In `bin`, we provide the executables `peerconnection_client` and `peerconnection_server` pre-compiled for Windows and Linux with AV1 activated and set as default and only available codec.

In `kite_tests`, we provide the source code for KITE tests.

# How to use peerconnection client and server

Two computers (let call them A and B) are needed. Each computer needs to have a camera.

- On computer A, launch `peerconnection_server`.
- On computer A, launch `peerconnection_client`.

![peerconnection_client A](http://ludo17.free.fr/av1_svc_demo/client_localhost.png) Example on Linux.

Keep `localhost` for server as `perconnection_server` is running on this computer.

Click button `Connect`.

- On computer B, launch `peerconnection_client`.

![peerconnection_client B](http://ludo17.free.fr/av1_svc_demo/client_remote.png) Example on Windows.

Type the IP address of computer A where `peerconnection_server` is running.

Click button `Connect`.

| Computer A (Linux) | Computer B (Windows) |
| --- | --- |
| ![List of peers on client A](http://ludo17.free.fr/av1_svc_demo/clientA_list.png) | ![List of peers on client B](http://ludo17.free.fr/av1_svc_demo/clientB_list.png) |

On either computer, A or B, you can double-click on the name of the other peer (highlighted in the above example) to start the WebRTC call.