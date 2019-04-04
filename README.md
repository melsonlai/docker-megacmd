# docker-megacmd: megacmd in docker

## Usage

1. Start the megacmd server
    ```
    docker run \
        -d \
        --name megacmd \
        --restart always \
        -v <folder_to_save_config>:/home/d_user \
        -v <folder_to_sync_outside>:<folder_to_sync_inside> \
        -e PUID=<exec_user_id> \
        -e PGID=<exec_group_id> \
        melsonlai/docker-megacmd:<tag>
    ```
2. Exec into the container to config the server
    ```
    docker exec -it megacmd su - d_user
    ~$ mega-login <account-email> <password>
    ~$ mega-sync <localpath> <dstremotepath>
    ```

## Tags

+ latest: multiarch manifest with `amd64` and `arm`
+ amd64: amd64 arch based on `ubuntu:18.04`
+ arm: arm arch based on `balenalib/rpi-debian:stretch-run`
