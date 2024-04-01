FROM mysql:8

# Create a directory for MySQL configuration
RUN mkdir -p /etc/mysql/conf.d

# Copy your custom MySQL configuration file into the image
COPY my.cnf /etc/mysql/conf.d/my.cnf

# Update MySQL configuration to use the custom configuration file
# Uncomment the line below if necessary, adjust the path as needed
ENV MYSQL_CONF_FILE /etc/mysql/conf.d/my.cnf
