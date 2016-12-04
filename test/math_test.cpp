#include <gtest/gtest.h>

#include "eval.hpp"

/* addition */

TEST(AdditionTest, HandlesPositiveNumbers) {
  ASSERT_EQ(2, evaluate("1 + 1"));
}

TEST(AdditionTest, HandlesNegativeNumbers) {
  ASSERT_EQ(0, evaluate("1 + -1"));
}


/* multiplication */

TEST(MultiplicationTest, HandlesPositiveNumbers) {
  ASSERT_EQ(6, evaluate("3 * 2"));
}

TEST(MultiplicationTest, HandlesNegativeNumbers) {
  ASSERT_EQ(-6, evaluate("3 * -2"));
}

TEST(MultiplicationTest, HasHigherPrecedenceThanAddition) {
  ASSERT_EQ(7, evaluate("3 * 2 + 1"));
  ASSERT_EQ(7, evaluate("1 + 3 * 2"));
}

TEST(MultiplicationTest, HasHigherPrecedenceThanSubtraction) {
  ASSERT_EQ(5, evaluate("3 * 2 - 1"));
  ASSERT_EQ(-5, evaluate("1 - 3 * 2"));
}


/* division */

TEST(DivisionTest, HandlesPositiveNumbers) {
  ASSERT_EQ(3, evaluate("6 / 2"));
}

TEST(DivisionTest, HandlesNegativeNumbers) {
  ASSERT_EQ(-3, evaluate("6 / -2"));
}

TEST(DivisionTest, HasHigherPrecedenceThanAddition) {
  ASSERT_EQ(4, evaluate("6 / 2 + 1"));
  ASSERT_EQ(4, evaluate("1 + 6 / 2"));
}

TEST(DivisionTest, HasHigherPrecedenceThanSubtraction) {
  ASSERT_EQ(0.5, evaluate("3 / 2 - 1"));
  ASSERT_EQ(-0.5, evaluate("1 - 3 / 2"));
}


/* subtraction */

TEST(SubtractionTest, HandlesPositiveNumbers) {
  ASSERT_EQ(1, evaluate("5 - 4"));
}

TEST(SubtractionTest, HandlesNegativeNumbers) {
  ASSERT_EQ(-9, evaluate("-5 - 4"));
}


/* exponents */

TEST(ExponentTest, HandlesPositiveNumbers) {
  ASSERT_EQ(25, evaluate("5 ^ 2"));
}

TEST(ExponentTest, HandlesNegativeNumbers) {
  ASSERT_EQ(-125, evaluate("-5 ^ 3"));
}

TEST(ExponentTest, HasHigherPrecedenceThanMultiplication) {
  ASSERT_EQ(-250, evaluate("-5 ^ 3 * 2"));
}

TEST(ExponentTest, HasHigherPrecedenceThanDivision) {
  ASSERT_EQ(-25, evaluate("-5 ^ 3 / 5"));
}


int main(int argc, char **argv) {
  testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}
