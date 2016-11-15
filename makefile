
SHELL := cmd.exe

# -- libcurl paths
CURL_DIR := .\extern\curl-7.51.0-win32-mingw
CURL_BIN := $(CURL_DIR)\bin
CURL_LIB := $(CURL_DIR)\lib
CURL_INC := $(CURL_DIR)\include

# -- linker flags
LDFLAGS :=

# -- compiler flags
CXXFLAGS :=
CXXFLAGS += -std=c++11 -O2 -Wall -pedantic
CXXFLAGS += -L$(CURL_LIB) -I$(CURL_INC)
CXXFLAGS += -lcurldll
# CXXFLAGS += -Wl,--subsystem=windows

CXX := @g++

NAME := mailchat

$(NAME).exe: main.o libcurl.dll
	$(CXX) -o $@ $< $(CXXFLAGS)
	
libcurl.dll:
	@copy $(CURL_BIN)\libcurl.dll . 1>NUL

.PHONY: clean
clean:
	@del $(NAME).exe 2>NUL
	@del *.o 2>NUL

.PHONY: run
run: $(NAME).exe
	@$(NAME).exe

