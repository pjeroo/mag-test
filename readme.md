# Запуск
    git clone https://github.com/pjeroo/mag-test
    ./run.sh

# Entrypoint.sh
Можно установить supervisord (http://supervisord.org/) и ипользовать его
в качестве альтернативы systemd внутри контейнера, чтобы избавиться от необходимости
следить за тем, что сервис не упал, а так же не нужно будет делать такие грязные трюки, как tail -f /dev/null
внутри entrypoint.sh. Но если установить python и python-pip, то размер контейнера возрастет на ~200 мб

## Конфигурации для supervisord
    [program:nginx]
    pidfile=/run/nginx.pid
    command=/usr/sbin/nginx
    priority=20
    
    # отключить режим демона в haproxy.cfg
    [program:haproxy]
    command=/usr/sbin/haproxy -f /usr/local/etc/haproxy/haproxy.cfg 
    user=memcached
    priority=10