#include "request.h"
#include <sstream>

lib::Request::Request() {

	curl = curl_easy_init();
	if(!curl) throw InitError();

	curl_easy_setopt(curl, CURLOPT_VERBOSE, 1L);

	curl_easy_setopt(curl, CURLOPT_CAINFO,
		"extern\\curl-7.51.0-win32-mingw\\bin\\curl-ca-bundle.crt");

	// curl_easy_setopt(curl, CURLOPT_SSLVERSION,
	// 	CURL_SSLVERSION_TLSv1);

	// curl_easy_setopt(curl, CURLOPT_USERAGENT,
	// 	"User-Agent: Mozilla/5.0 (Windows NT 5.1;"
	// 	" rv:41.0) Gecko/20100101 Firefox/41.0");

	// curl_easy_setopt(curl, CURLOPT_LOGIN_OPTIONS, "AUTH=XOAUTH2");

}

lib::Request::~Request() {
	curl_easy_cleanup(curl);

}

void lib::Request::test() {
	
	curl_easy_setopt(curl, CURLOPT_USERNAME, username.c_str());
	curl_easy_setopt(curl, CURLOPT_PASSWORD, password.c_str());
	
	std::stringstream pop3_url;
	pop3_url << "pop3s://" << host << ":" << port;

	printf("pop3_url: '%s'\n\n", pop3_url.str().c_str());

	curl_easy_setopt(curl, CURLOPT_URL, pop3_url.str().c_str());

	// curl_easy_setopt(curl, CURLOPT_CUSTOMREQUEST, "UIDL");
	result = curl_easy_perform(curl);

	if(CURLE_OK != result)
	{
		fprintf(stderr, "curl_easy_perform() failed: %s\n",
			curl_easy_strerror(result));
	}

}

