## Project Introduction

Simple sales managing dashboard for small clothing business writted in Java (Spring Boot).

I created this project back when I was in college and total forgot about it. It's just today when I was cleaning up junks my personal laptop that I noticed all the past projects that I did back then. Nostalgia hit hard... Good times! haha.

## Tech Stacks

- Java Spring Boot
- PostgreSQL
- Angular.js

## Setup

### Clone the repository

```bash

# Clone with SSH
$ git clone git@github.com:manjillama/clothing-manager.git

# Or with HTTPS
$ git clone https://github.com/manjillama/clothing-manager.git
```

## Configuration

Navigate to `src/main/resources` directory and update the configuration with your own.

```
spring.jpa.database=POSTGRESQL
spring.datasource.platform=postgres
spring.datasource.url=jdbc:postgresql://localhost:5432/{{YOU_DB}}
spring.datasource.username=
spring.datasource.password=

# Admin username and password to login
username=manjiltamang
password=admin123

# Auto generates DDL
spring.jpa.generate-ddl=true
```
