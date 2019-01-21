FROM alpine:3.7

LABEL maintainer="Ederlo Rodrigo de Oliveira ederlo.contato@gmail.com.br"

WORKDIR /app

RUN apk update && apk add docker

COPY . .

RUN mkdir -p logs \
&& chmod -R 755 logs \
&& chmod +x start.sh

ENTRYPOINT [ "./start.sh"]

