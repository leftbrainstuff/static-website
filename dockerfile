# GitHub:       https://github.com/gohugoio
# Twitter:      https://twitter.com/gohugoio
# Website:      https://gohugo.io/

FROM node:8.12.0-alpine AS build

ENV CGO_ENABLED=0
ENV GOOS=linux
ENV GO111MODULE=on

WORKDIR /go/src/github.com/leftbrainstuff/static-website/
RUN apk add --no-cache \
    git \
    musl-dev
COPY . /go/src/github.com/leftbrainstuff/static-website/
RUN go install -ldflags '-s -w'

# ---

FROM scratch
COPY --from=build /go/bin/hugo /hugo
WORKDIR /site
VOLUME  /site
EXPOSE  1313
ENTRYPOINT [ "/hugo" ]
CMD [ "--help" ]
