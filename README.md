# Docker_Django-Apach-PGSQL_example
**It is just an example, please, don't use it on real web-server!**

https://github.com/shutovds/Docker_Django-Apach-PGSQL_example

## For run:
1. `git clone https://github.com/shutovds/Docker_Django-Apach-PGSQL_example.git`
2. `cd Docker_Django-Apach-PGSQL_example`
3. `docker-compose up`
4. go to http://0.0.0.0:8080 to see if Apache2 server works 

### Then you can make migrations and create superuser:
#### Migrations:
- `docker container ls` - check CONTAINER ID
- `docker exec -ti <CONTAINER ID> bash`
- `source venv/bin/activate`
- `python3 manage.py migrate`

#### Superuser:
- `python3 manage.py createsuperuser`

#### Database changing:
You can also change the database folder: **postgre_datadir**, but be careful, it might lead to fail. However you can make backup of your database.

#### Run Django server:
- `python3 manage.py runserver 0.0.0.0:8000`
- go to http://0.0.0.0:8000 to see if Django server works

### It is a bad idea to keep DEBUG = True for Apache server and it will be better to change it to False :
- go to *website/settings.py* and change **DEBUG = True** to **DEBUG = False**



