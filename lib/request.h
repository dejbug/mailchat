#ifndef _REQUEST_H_
#define _REQUEST_H_

#include <curl/curl.h>
#include <string>
#include "macros.h"

NAMESPACE_BEGIN(lib)

struct Request {
	struct Error {};
	struct InitError : Error {};

	Request();
	virtual ~Request();

	void test();

private:
	CURL *curl = nullptr;
public:
	CURLcode result = CURLE_OK;
	std::string username, password;
	std::string host;
	size_t port;
};

NAMESPACE_END(lib)

#endif
