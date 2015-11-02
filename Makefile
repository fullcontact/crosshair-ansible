.PHONY: clean test test_default dependencies

all: test

clean:
	vagrant destroy -f

dependencies:
	ansible-galaxy install -f jdauphant.nginx,v1.3.4
	ansible-galaxy install -f zenoamaro.supervisord,v0.3.1
	ansible-galaxy install -f geerlingguy.redis,1.1.5

test: test_default

test_default: dependencies clean
	PLAYBOOK_FILE='test_default.yml' vagrant up
