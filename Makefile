.PHONY: *

default: build push

build:
	docker --config ${HOME}/.config/xisgo-docker build --tag xisgo/php74-fpm:$(v) .

push:
	docker --config ${HOME}/.config/xisgo-docker push xisgo/php74-fpm:$(v)

images:
	docker --config ${HOME}/.config/xisgo-docker images xisgo/php74-fpm