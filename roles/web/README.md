# web
Role to manage web server with nginx and php

## variables
- eher_web_name - just a name to identify the website
- eher_web_server_name - the domain that the website will responde (without www)
- eher_web_root - path to the root of the website
- eher_web_try_files - custom nginx try_files of the website
- eher_web_rewrite - a list of rewrites
- eher_web_php_enabled - a boolean to enable php on the website
- eher_web_php_params - environment variables that will be available to php

## how it works
```yml
---
roles:
  - role: web
    eher_web_name: 'queroservoluntario'
    eher_web_server_name: 'queroservoluntario.com'
    eher_web_root: '/var/www/queroservoluntario/web'
    eher_web_try_files: "$uri $uri/ /index.php?url=$uri&$args"
    eher_web_rewrite:
      - /css/main.css /min/?g=css
      - /js/head.js /min/?g=js_head
      - /js/body.js /min/?g=js_body
    eher_web_php_enabled: true
    eher_web_php_params: 
      - SYMFONY__DATABASE__HOST "localhost"
      - SYMFONY__DATABASE__NAME queroservoluntario
      - SYMFONY__DATABASE__USER root
      - SYMFONY__DATABASE__PASSWORD ""
```
