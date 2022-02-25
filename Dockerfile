FROM esydev/esy:nightly-alpine-latest as builder
RUN apk add libexecinfo-dev
WORKDIR /app
COPY ./esy.lock package.json ./
RUN esy install
RUN esy build-dependencies --release
COPY . .
RUN esy install
RUN esy build
RUN esy cp "#{self.target_dir / 'default' / 'src' / 'bin' / 'repeatable.exe'}" repeatable.exe 
RUN strip ./repeatable.exe
ENTRYPOINT ["./repeatable.exe"]
CMD [""]
