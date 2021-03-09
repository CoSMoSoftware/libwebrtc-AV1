# Source code + patch 0001_av1_svc_sfm_poc.patch

Tested on webrtc commit 1413e

    commit 1413e2db4c9b186176a54e70c52f5b673c2cb939 (HEAD, origin/lkgr, branch-heads/4438)
    Author: webrtc-version-updater <webrtc-version-updater@webrtc-ci.iam.gserviceaccount.com>
    Date:   Thu Mar 4 20:03:31 2021 -0800

        Update WebRTC code version (2021-03-05T04:03:29).

        TBR=webrtc-version-updater@webrtc-ci.iam.gserviceaccount.com,mbonadei@webrtc.org

        Bug: None
        Change-Id: I8fbcbf192da90593ad03fc8da0392957d33753ce
        Reviewed-on: https://webrtc-review.googlesource.com/c/src/+/209861
        Reviewed-by: webrtc-version-updater@webrtc-ci.iam.gserviceaccount.com <webrtc-version-updater@webrtc-ci.iam.gserviceaccount.com>
        Commit-Queue: webrtc-version-updater@webrtc-ci.iam.gserviceaccount.com <webrtc-version-updater@webrtc-ci.iam.gserviceaccount.com>
        Cr-Commit-Position: refs/heads/master@{#33387}

## Get webrtc source code

    mkdir webrtc
    cd webrtc
    fetch --no-hooks webrtc
    cd src
    git checkout 1413e2
    gclient sync

Apply patch 0001_av1_svc_sfm_poc.patch

    git apply --ignore-space-change --ignore-whitespace --whitespace=nowarn 0001_av1_svc_sfm_poc.patch

## Compile

### Windows

    gn gen out/release --args="is_debug=false treat_warnings_as_errors=false is_component_build=false target_cpu=\"x64\" use_rtti=true enable_libaom=true"
    ninja -C out/release

### Linux

    gn gen out/release --args='is_debug=false treat_warnings_as_errors=false is_component_build=false target_cpu="x64" use_rtti=true enable_libaom=true'
    ninja -C out/release

Executables `peerconnection_client(.exe)` and `peerconnection_server(.exe)` are located in directory `out/release`