Docker image of Helix P4D.
=========================

[![licence badge]][licence]

# Build Details

- [Source Repository](https://github.com/mmorita44/helix-p4d)
- [Dockerfile](https://github.com/mmorita44/helix-p4d/blob/master/Dockerfile)

# Usage

Run docker image.

```
$ docker run -d  -p 1666:1666 -v mmorita44/helix-p4d:latest
```

Also run docker-compose.

```
version: '2'
services:
  helix-p4d:
    image: mmorita44/helix-p4d:latest
    ports:
      - 1666:1666
    volumes:
      - data-helix-p4d-servers:/opt/perforce/servers
      - data-helix-p4d-triggers:/opt/perforce/triggers

volumes:
  data-helix-p4d-servers:
    driver: local

  data-helix-p4d-trigers:
    driver: local
```


[licence]: <LICENSE>
[licence badge]: http://img.shields.io/badge/license-MIT-blue.svg?style=flat
