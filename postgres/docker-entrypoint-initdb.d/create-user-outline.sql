CREATE USER outline WITH PASSWORD 'outline';
CREATE DATABASE knowledge;
GRANT ALL PRIVILEGES ON DATABASE knowledge TO outline;
\c knowledge
GRANT ALL ON SCHEMA public TO outline;