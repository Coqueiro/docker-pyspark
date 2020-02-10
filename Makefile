HUB_PUBLISHER?=coqueirotree
HUB_PASSWORD?=$(shell cat .hub_password)
IMAGE=${HUB_PUBLISHER}/docker-pyspark
VERSION=$(shell cat VERSION)
BUMP_LEVEL?=patch # [patch, minor, major]
GIT_BRANCH=$(shell git branch | sed -n -e 's/^\* \(.*\)/\1/p')

build:
	@docker build -t "${IMAGE}:${VERSION}" .
	@docker tag ${IMAGE}:${VERSION} ${IMAGE}:latest

login:
	@docker login --username ${HUB_PUBLISHER} --password ${HUB_PASSWORD}

push: login
	@docker push ${IMAGE}:${VERSION}
	@docker push ${IMAGE}:latest

bump:
	@python3 -m pip install bumpversion==0.5.3
	@bumpversion --current-version ${VERSION} ${BUMP_LEVEL} VERSION
	@git add VERSION
	@git commit -m "Version bump to ${VERSION}"
	@git push origin ${GIT_BRANCH}

release: bump build push

pull:
	@docker pull ${IMAGE}:${VERSION}
	@docker pull ${IMAGE}:latest