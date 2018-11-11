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
        melsonlai/megacmd
    ```
2. Exec into the container to config the server
    ```
    docker exec -it megacmd bash
    ```

## Tags

+ amd64: amd64 arch based on ubuntu:18.04
