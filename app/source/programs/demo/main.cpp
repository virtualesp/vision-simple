#include <windows.h>
#include <iostream>

#if defined(_WIN32)
int APIENTRY WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow)
#else
int main(int argc,char *argv[])
#endif
{
    std::cout << "main" << std::endl;
}