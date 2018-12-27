sudo cp /home/box/web/etc/nginx.conf  /etc/nginx/sites-enabled/default
sudo /etc/init.d/nginx restart
sudo cp /home/box/web/etc/gunicorn-django.conf   /etc/gunicorn.d/test
sudo /etc/init.d/gunicorn restart
sudo /etc/init.d/mysql start
# gunicorn ask.wsgi:application --bind 0.0.0.0:8000 &