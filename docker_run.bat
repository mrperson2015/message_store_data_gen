@echo OFF

SET CONTAINER_NAME=msg_store-data_gen
IMAGE="mrperson2015/message_store_data_gen"

FOR /F "tokens=* USEBACKQ" %%g IN (`docker container ls -a --format "{{.Names}}"`) do (
    echo %%g=%CONTAINER_NAME%
    IF %%g==%CONTAINER_NAME% (
        echo Stopping and Removing container [%CONTAINER_NAME%]
        docker rm --force "%CONTAINER_NAME%")
    
    )

docker run ^
    -it ^
    --name %CONTAINER_NAME% ^
    %IMAGE%:latest /bin/bash