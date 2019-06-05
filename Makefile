all: compile

depends:
	rebar get-deps
	rebar update-deps

compile:
	rebar compile

clean:
	rebar clean
	rm priv/*.so

.PHONY: all depends compile
