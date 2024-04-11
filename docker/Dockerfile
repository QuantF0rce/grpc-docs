FROM node

ENV PROTOC_GEN_DOC_VERSION=1.5.1

RUN apt-get update && apt-get install -y protobuf-compiler
RUN mkdir /protoc-plugins/
RUN wget -O protoc-gen-doc.tar.gz https://github.com/pseudomuto/protoc-gen-doc/releases/download/v${PROTOC_GEN_DOC_VERSION}/protoc-gen-doc_1.5.1_linux_amd64.tar.gz && \
    tar -xf protoc-gen-doc.tar.gz && \
    cp  protoc-gen-doc /protoc-plugins/protoc-gen-doc
ENV PATH="/protoc-plugins/:${PATH}"
RUN git clone --depth 1 https://github.com/googleapis/googleapis.git /deps/googleapis/
RUN git clone --depth 1 https://github.com/quantf0rce/grpc-docs && \
    cd ./grpc-docs && \
    yarn && \
    cd example && \
    yarn
RUN mkdir -p /output-gen

ENV NODE_OPTIONS=--openssl-legacy-provider
ADD docker/files/App.tsx /grpc-docs/example/src/App.tsx
ADD docker/entrypoint.sh /home/entrypoint.sh
RUN cd /grpc-docs/example/ && yarn build

ENTRYPOINT ["bash", "/home/entrypoint.sh"]
