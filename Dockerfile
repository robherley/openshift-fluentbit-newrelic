FROM golang:1.11 AS builder

WORKDIR /build

RUN git clone https://github.com/newrelic/newrelic-fluent-bit-output .
RUN make all

FROM fluent/fluent-bit:1.3.5

COPY --from=builder /build/out_newrelic.so /fluent-bit/bin/

CMD ["/fluent-bit/bin/fluent-bit", "-c", "/fluent-bit/etc/fluent-bit.conf", "-e", "/fluent-bit/bin/out_newrelic.so"]
