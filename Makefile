help:
	@echo "help     - tato nápověda"
	@echo "web      - vygeneruje web"
	@echo "next     - přidá šablonu na další týden"
	@echo "test     - spustí testy"
	@echo "install  - nainstaluje ruby závislosti a vytvoří odkaz na pre-commit script"

web:
	bundle exec middleman build --clean

install:
	bundle install
	./bin/install.sh

next:
	./bin/next

test:
	./bin/pre-commit
