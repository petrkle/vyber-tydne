help:
	@echo "help     - tato nápověda"
	@echo "web      - vygeneruje web"
	@echo "server   - spustí náhled webu"
	@echo "next     - přidá šablonu na další týden"
	@echo "test     - spustí testy"
	@echo "install  - nainstaluje ruby závislosti a vytvoří odkaz na pre-commit script"
	@echo "clean    - smaže generované ikonky"

web:
	./icons.sh
	bundle exec middleman build --clean

server:
	bundle exec middleman server

install:
	gem install bundler -v 2.0.1
	bundle install
	./bin/install.sh

next:
	./bin/next

test:
	./bin/pre-commit

clean:
	rm -f source/img/vyber-*.png
