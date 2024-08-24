FROM minio/mc
COPY . /
RUN chmod +x /configure.sh
ENTRYPOINT [ "/configure.sh" ]
