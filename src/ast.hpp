#pragma once

class Expression {
public:
  virtual ~Expression() {}

  virtual Expression *clone () = 0;
  virtual double value () = 0;
};

class Plus : public Expression {
  Expression *m_left;
  Expression *m_right;

public:
  Plus(Expression *left, Expression *right): m_left(left), m_right(right) {}

  virtual double value() { return m_left->value() + m_right->value(); }

  virtual Plus* clone() { return new Plus(*this); }

  Plus &operator = (const Plus &other) {
    if(&other != this) {
      delete m_left;
      delete m_right;

      m_left = other.m_left->clone();
      m_right = other.m_right->clone();
    }
  }
};

/* class Times : public BinaryOperation { */
/* public: */
/*   virtual double value() { return getLeft()->value() * getRight()->value(); } */

/*   virtual Times* clone() { return new Times(*this); } */
/* }; */

/* class Divide : public BinaryOperation { */
/* public: */
/*   virtual double value() { return getLeft()->value() / getRight()->value(); } */

/*   virtual Divide* clone() { return new Divide(*this); } */
/* }; */

/* class Minus : public BinaryOperation { */
/* public: */
/*   virtual double value() { return getLeft()->value() - getRight()->value(); } */

/*   virtual Minus* clone() { return new Minus(*this); } */
/* }; */


class Number : public Expression {
  double m_value;

public:
  Number(double value): m_value(value) {}

  virtual Number* clone() { return new Number(m_value); }

  virtual double value() { return (double)m_value; }
};
