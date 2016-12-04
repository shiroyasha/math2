#include <string>
#include <iostream>

#include "eval.hpp"

int main() {
  std::string source = "1 * 1";

  std::cout << evaluate(source) << std::endl;

  return 0;
}
