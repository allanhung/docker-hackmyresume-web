FROM nouchka/hackmyresume
MAINTAINER Jean-Avit Promis "docker@katagena.com"
LABEL org.label-schema.vcs-url="https://github.com/nouchka/docker-hackmyresume-web"
LABEL version="1.0"

ENV RESUME_JSON_URL https://raw.githubusercontent.com/nouchka/docker-hackmyresume/master/resume.json

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install \
    nginx && \
    rm -rf /var/lib/apt/lists/*

COPY nginx-start.sh /nginx-start.sh
RUN chmod +x /nginx-start.sh

EXPOSE 80 443

CMD /nginx-start.sh
