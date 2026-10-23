# PlateWise Root Makefile (delegates to platewise directory)

.PHONY: dev backend frontend test eval seed load

dev:
	@cd platewise && $(MAKE) dev

backend:
	@cd platewise && $(MAKE) backend

frontend:
	@cd platewise && $(MAKE) frontend

test:
	@cd platewise && $(MAKE) test

eval:
	@cd platewise && $(MAKE) eval

seed:
	@cd platewise && $(MAKE) seed

load:
	@cd platewise && $(MAKE) load
