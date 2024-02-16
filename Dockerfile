FROM ubuntu

LABEL maintainer="jaya"

# Install packages: mysql adds a root user with no password
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -y mysql-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Change mysql to listen on 0.0.0.0
RUN sed -i -e "s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf

# Setup our username
ENV USER=jaya
ENV PASSWORD=123
ENV PASS=pass

# Copy MySQL initialization script
COPY mysql.sh /mysql.sh
RUN chmod +x /mysql.sh

# Expose MySQL port
EXPOSE 3306

# Start MySQL and run initialization script
CMD ["bash", "-c", "service mysql start && /mysql.sh && bash"]

