xhost local:docker
nvidia-docker run -it -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=${DISPLAY} --env QT_X11_NO_MITSHM=1 --network=host -v /usr/lib/nvidia-450:/usr/lib/nvidia-450 -v /usr/lib32/nvidia-450:/usr/lib32/nvidia-450 -v /home/edith/:/home/root/workspace --privileged --name my_EF_container my_elasticfusion


# ElasticFusion Dockerfile
Dockerfile for use of [ElasticFusion](https://github.com/mp3guy/ElasticFusion)

## Docker build and run

```terminal
$ docker build -t <image_name> ./docker
$ ./opendocker.sh <image_name>
```

## Run with RealSense

I tested only with RealSense D435.

```terminal
$ ElasticFusion
# data is saved as `/opt/ElasticFusion/GUIlive.ply`
```

## Run with sample data

```terminal
$ wget http://www.doc.ic.ac.uk/~sleutene/datasets/elasticfusion/dyson_lab.klg -P ./workspace
# in container
$ ElasticFusion -l dyson_lab.klg
```

![image](https://user-images.githubusercontent.com/25898373/70848804-1d25fa80-1eba-11ea-92c3-2295a08984d8.png)

## Visualize result

```terminal
$ pipenv sync
$ pipenv shell
$ python visualize.py --ply <path/to/.ply>
```

![image](https://user-images.githubusercontent.com/25898373/70864791-f7235780-1f98-11ea-8367-738205205726.png)
