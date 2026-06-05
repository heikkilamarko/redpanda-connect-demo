FROM quay.io/minio/aistor/mc
COPY . /
RUN chmod +x /configure.sh
ENTRYPOINT [ "/configure.sh" ]
