
SHELL := cmd.exe

# -- libcurl paths
CURL_DIR := .\extern\curl-7.51.0-win32-mingw
CURL_BIN := $(CURL_DIR)\bin
CURL_LIB := $(CURL_DIR)\lib
CURL_INC := $(CURL_DIR)\include

# -- OpenSSL paths
OSSL_DIR := .\extern\openssl-1.1.0c
OSSL_BIN := $(OSSL_DIR)\bin
OSSL_LIB := $(OSSL_DIR)\lib
OSSL_INC := $(OSSL_DIR)\include

# -- linker flags
LDFLAGS :=

# -- compiler flags
CXXFLAGS :=
CXXFLAGS += -std=c++11 -O2 -Wall -pedantic
CXXFLAGS += -L$(CURL_LIB) -I$(CURL_INC)
CXXFLAGS += -lcurldll
CXXFLAGS += -I.
# CXXFLAGS += -Wl,--subsystem=windows

CXX := g++
NAME := mailchat
OBJS := lib/request.o
# OBJS += $(CURL_LIB)/libcurl.a

.PHONY: all
all: dlls $(NAME).exe

$(NAME).exe: main.o $(OBJS)
	$(CXX) $^ -o $@ $(CXXFLAGS)

.PHONY: dlls
dlls:
	@copy $(CURL_BIN)\libcurl.dll . 1>NUL
	@copy $(OSSL_BIN)\libcrypto-1_1.dll . 1>NUL
	@copy $(OSSL_BIN)\libssl-1_1.dll . 1>NUL

.PHONY: clean
clean:
	@del $(NAME).exe 2>NUL
	@del *.dll 2>NUL
	@del *.o 2>NUL
	@del lib\*.o 2>NUL

.PHONY: run
run: $(NAME).exe
	@$(NAME).exe

