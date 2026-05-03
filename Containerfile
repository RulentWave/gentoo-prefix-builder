FROM gentoo/portage@sha256:3ed6f13270d2ddfc16d6523976f628672e723ba8875e13223333fbf82027f043 as portage

FROM gentoo/stage3@sha256:6e7a4e14829607fd3c7d99197a0873020b6127a7578f8b380f15a1e7924bb3bb

ARG PREFIX=/usr/lib/gentoo-prefix

WORKDIR /opt/app

COPY bootstrap-prefix-with-root.sh .
RUN chmod +x bootstrap-prefix-with-root.sh && \
    ./bootstrap-prefix-with-root.sh ${PREFIX} noninteractive

COPY --from=portage /var/db/repos/gentoo ${PREFIX}/var/db/repos/gentoo
