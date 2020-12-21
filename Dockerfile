FROM golang:alpine
RUN apk add make
COPY ./ /src/
WORKDIR /src/
RUN make
# TODO: split this dockerfile here
# to prevent unneccessary layers in the final image
RUN install syslog_ng_exporter -t /bin
ENTRYPOINT ["/bin/syslog_ng_exporter"]
EXPOSE     9577
