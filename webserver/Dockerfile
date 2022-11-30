FROM nginx
COPY index.html /usr/share/nginx/html/index.html
COPY package.json /usr/share/nginx/html/package.json
COPY package-lock.json /usr/share/nginx/html/package-lock.json
COPY style-temporary.css /usr/share/nginx/html/style-temporary.css
COPY vite.config.js /usr/share/nginx/html/vite.config.js
ADD /src /usr/share/nginx/html/src
ADD /public /usr/share/nginx/html/public
#stuff