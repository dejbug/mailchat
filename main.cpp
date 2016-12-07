#define WIN32_LEAN_AND_MEAN
#define STRICT
#include <windows.h>
#include <iostream>

#include <lib/request.h>

int main()
{
	auto req = lib::Request();

	req.host = "pop.gmail.com";
	req.port = 995;
	std::cout << "username: ";
	std::cin >> req.username;
	std::cout << "password: ";
	std::cin >> req.password;

	req.test();

	return 0;
}
