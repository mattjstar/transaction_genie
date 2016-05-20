# Transaction Genie

### Getting usable data

```
curl $(heroku pg:backups public-url b003) > production.dump
pg_restore --verbose --clean --no-acl --no-owner -h localhost -d transaction_genie_development production.dump

```
