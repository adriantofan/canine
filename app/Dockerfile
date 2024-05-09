FROM --platform=linux/amd64 debian:bookworm-slim AS build-env

RUN apt-get update
RUN apt-get install -y curl git unzip xz-utils zip libglu1-mesa


ARG FLUTTER_SDK=/usr/local/flutter
ARG FLUTTER_VERSION=3.19.6
ARG APP=/app/

RUN curl "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_$FLUTTER_VERSION-stable.tar.xz" \
    -o "flutter_linux_$FLUTTER_VERSION-stable.tar.xz"
RUN mkdir -p $FLUTTER_SDK

RUN xz --decompress --verbose "flutter_linux_$FLUTTER_VERSION-stable.tar.xz"
RUN tar -xf "flutter_linux_$FLUTTER_VERSION-stable.tar" -C /usr/local

RUN rm -f "flutter_linux_$FLUTTER_VERSION-stable.tar.xz"

ENV PATH="$FLUTTER_SDK/bin:$FLUTTER_SDK/bin/cache/dart-sdk/bin:${PATH}"

RUN git config --global --add safe.directory $FLUTTER_SDK
RUN flutter doctor -v


RUN mkdir $APP
COPY . $APP
WORKDIR $APP


RUN flutter clean
RUN flutter pub get
RUN flutter build web --base-href=/app/



FROM --platform=linux/amd64 nginxinc/nginx-unprivileged:alpine-slim

WORKDIR /usr/share/nginx/html
COPY --chown=nginx:nginx deploy/default.conf /etc/nginx/conf.d/default.conf
COPY --chown=nginx:nginx --from=build-env /app/build/web /usr/share/nginx/html

EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
