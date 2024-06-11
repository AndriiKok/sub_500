FROM ubuntu:22.04

# Add a non-root user

USER root

# Install necessary dependencies
RUN apt-get update -y && \
    apt-get install -y wget tar

EXPOSE 26658
EXPOSE 2121

WORKDIR /home/root

RUN wget http://nubit.sh/nubit-bin/nubit-node-linux-x86_64.tar

RUN tar -xvf nubit-node-linux-x86_64.tar
RUN mv nubit-node-linux-x86_64 "/home/root/nubit-node"
RUN rm nubit-node-linux-x86_64.tar

WORKDIR /home/root/nubit-node

# Make start.sh executable and update it
RUN chmod +x start.sh
RUN sed -i -e '/\$BINARY \$NODE_TYPE start --metrics --metrics.tls=false --metrics.endpoint otel.nubit-alphatestnet-1.com:4318 --metrics.interval 3600s/{ N; s/\n/ / }' start.sh

# Specify the command to run when the container starts
CMD ["./start.sh"]
