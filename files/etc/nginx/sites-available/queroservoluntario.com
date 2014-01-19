server {
    listen 80;

    server_name queroservoluntario.com www.queroservoluntario.com;
    root /var/www/queroservoluntario.com/web/;

    try_files $uri $uri/ /index.php?$args;

    location ~ \.php$ {
        fastcgi_pass unix:/var/run/php5-fpm.sock;
    }
}
