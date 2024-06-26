# Etap pierwszy

FROM scratch AS builder

ADD alpine-minirootfs-3.19.1-x86_64.tar /

# Zdefiniowanie zmiennej środowiskowej dla wersji aplikacji
ARG VERSION
ENV APP_VERSION=${VERSION}

# Ustawienie katalogu roboczego
WORKDIR /usr/app

# Skopiowanie pliku package.json do katalogu roboczego
COPY ./package.json ./

# Instalacja node.js i npm
RUN apk add --no-cache nodejs npm

# Instalacja zależności
RUN npm install

# Skopiowanie pliku index.js do katalogu roboczego
COPY ./index.js ./

#######################################

# Etap drugi

FROM nginx:latest

# Skopiowanie plików z etapu pierwszego do katalogu roboczego
COPY --from=builder /usr/app /usr/share/nginx/html

# Skopiowanie pliku default.conf do katalogu roboczego
COPY ./default.conf /etc/nginx/conf.d/default.conf

COPY start.sh /usr/share/nginx/html

# Make the script executable
RUN chmod +x /usr/share/nginx/html/start.sh

# Ustawienie portu
EXPOSE 80

# Instalacja node.js
RUN apt update && apt install -y nodejs

# Uruchomienie serwera nginx i aplikacji
CMD ["/usr/share/nginx/html/start.sh"]


# Sprawdzenie dostępności aplikacji
HEALTHCHECK --interval=30s --timeout=3s CMD wget --quiet --tries=1 --spider http://localhost || exit 1

