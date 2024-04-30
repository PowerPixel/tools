CREATE USER authelia WITH PASSWORD 'authelia';
CREATE DATABASE authelia;
GRANT ALL PRIVILEGES ON DATABASE authelia TO authelia;
\c authelia
GRANT ALL ON SCHEMA public TO authelia;