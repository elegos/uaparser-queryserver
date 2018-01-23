FROM golang:alpine

RUN mkdir /uaparser
WORKDIR "/uaparser"

COPY out/uaparser /usr/local/bin/uaparser
COPY out/regexes.yaml /uaparser/regexes.yaml

CMD ["/usr/local/bin/uaparser"]

EXPOSE 8080
