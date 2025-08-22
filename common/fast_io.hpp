#ifndef FAST_IO_HPP
#define FAST_IO_HPP

#include <iostream>
#include <string>

// Fast I/O helpers for zyBooks-style labs
// No external dependencies - just standard C++

// Read a single integer from stdin
inline int read_int() {
    int value;
    std::cin >> value;
    return value;
}

// Read a single line from stdin
inline std::string read_line() {
    std::string line;
    std::getline(std::cin, line);
    return line;
}

// Print a value without newline
template<typename T>
inline void print(const T& value) {
    std::cout << value;
}

// Print a value with newline
template<typename T>
inline void println(const T& value) {
    std::cout << value << std::endl;
}

// Print a newline
inline void println() {
    std::cout << std::endl;
}

#endif // FAST_IO_HPP
