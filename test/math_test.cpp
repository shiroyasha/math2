#include <gtest/gtest.h>

#include "eval.hpp"

TEST(SimpleAdditionTest, PositiveNumbers) {
  ASSERT_EQ(evaluate("1 + 1"), 2);
}

int main(int argc, char **argv) {
  testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}
