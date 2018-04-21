# Managing environments with Vagrant and Docker

This repo contains:
* a basic python web service
* a Vagrantfile for dev env definition
* a Dockerfile for prod env definition

## Useful Commands

###  To run the app

```bash
python demo.py
```

### Vagrant

1- Create the environment
```bash
# from the project's root dir
vagrant up
```

2- access the machine
```bash
vagrant ssh
```

### Docker

1- Build the docker image
```bash
# from the project's root dir
docker build -t dlc-hello-world .
```

2- Run the docker container
```bash
docker run  -p 5000:5000 -t dlc-hello-world
```
