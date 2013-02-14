#!/bin/sh
erl +K true -pa ebin deps/*/ebin -s hello_world

