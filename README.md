# Laravel \ Lumen docker template

Docker template for running Laravel or Lumen app

# Quick start

1. Copy env file and modify if needed `cp .env.dist .env`
2. Build up containers `docker-compose build --build-arg UID=$(id -u) --build-arg GID=$(id -g) --no-cache`

# Services 

1. Nginx
2. PHP 7.4
3. Node 13
4. MySql 5.7
5. Redis
