all: build run clean

build: main.mojo
	@mojo build main.mojo

run: main
	@./main

clean: main
	@rm main
