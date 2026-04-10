# Use the official PHP Apache image as the base image
FROM php:8.3-apache

# Install dependencies required for OCI8 and PDO_OCI
RUN apt-get update && apt-get install -y \
    libaio1 \
    wget \
    unzip \
    libpng-dev \
    libxml2-dev \
    alien \
    build-essential

# Set environment variables for Oracle Instant Client installation
ENV ORACLE_HOME=/usr/lib/oracle/21/client64
ENV LD_LIBRARY_PATH=$ORACLE_HOME/lib
ENV PATH=$ORACLE_HOME/bin:$PATH

# Download and install Oracle Instant Client 21 Basic and SDK
RUN mkdir -p /usr/lib/oracle && \
    cd /usr/lib/oracle && \
    wget https://download.oracle.com/otn_software/linux/instantclient/2115000/oracle-instantclient-basic-21.15.0.0.0-1.el8.x86_64.rpm && \
    wget https://download.oracle.com/otn_software/linux/instantclient/2115000/oracle-instantclient-devel-21.15.0.0.0-1.el8.x86_64.rpm && \
    alien -i oracle-instantclient-basic-21.15.0.0.0-1.el8.x86_64.rpm && \
    alien -i oracle-instantclient-devel-21.15.0.0.0-1.el8.x86_64.rpm && \
    rm -f oracle-instantclient-*.rpm

# Link the SDK headers to /usr/include/oracle to ensure PECL can find them
RUN mkdir -p /usr/include/oracle/21/client64 && \
    ln -s $ORACLE_HOME/sdk/include /usr/include/oracle/21/client64

# Install OCI8 using PECL
RUN echo 'instantclient,/usr/lib/oracle/21/client64/lib' | pecl install oci8 && \
    docker-php-ext-enable oci8

# Enable additional PHP extensions as needed
RUN echo 'instantclient,/usr/lib/oracle/21/client64/lib' | pecl install pdo_oci && \
    docker-php-ext-enable pdo_oci

# Set working directory and copy application code
WORKDIR /var/www/html
COPY ./src /var/www/html

# Expose the default Apache port
EXPOSE 80
