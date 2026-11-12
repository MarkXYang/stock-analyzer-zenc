# Makefile for Zen C Stock Analyzer (GTK4 + Cairo + Gemini)

ZC = zc
TARGET = stock-analyzer

all: build

build:
	$(ZC) build main.zc -o $(TARGET)

test:
	$(ZC) run tests.zc

run: build
	./$(TARGET)

clean:
	rm -f $(TARGET) tests

.PHONY: all build test run clean
