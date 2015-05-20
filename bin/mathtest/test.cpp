#include <iostream>

int main(int argc, char *argv[]) {
    double a = 1.;
    double b = a / 10.;

    for(int i=0; i<9; i++) {
        a = a - b;
    }

    double delta = 1 - a*10;

    std::cout << delta << std::endl;

    return 0;
}
