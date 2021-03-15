db-migrate:
	docker-compose run --rm web bash -c "bundle exec rails db:create && bundle exec rails db:migrate"

up-dependences:
	docker-compose up -d db redis elasticsearch

app-install:
	up-dependences db-migrate

up-web:
	docker-compose run --rm --service-ports web

up-console:
	docker-compose run --rm web bundle exec rails c
