web:
	bundle exec middleman build --clean

install:
	bundle install

test:
	.git-hooks/pre-commit
