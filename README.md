# restful-django-api-tdd

Backend API using RESTFUL Django framework and Test Driven Development ~ testing update


# Start Django project named 'app' using run 'app' service
```bash
docker-compose run app sh -c "django-admin.py startproject app ."
```
# Run tests and flake8 validations with docker-compose run 'app' service
```bash
docker-compose run app sh -c "python manage.py test && flake8"
```
# Create Django app named 'core' with docker-compose run 'app' service
```bash
docker-compose run --rm app sh -c "python manage.py startapp core"
```
# Run Django migrations (each time you do a change into models)
```bash
docker-compose run app sh -c "python manage.py makemigrations core"
```
# Create superuser
```bash
docker-compose run app sh -c "python manage.py createsuperuser"
```


