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


class Minus : public Expression {
  Expression *m_left;
  Expression *m_right;

public:
  Minus(Expression *left, Expression *right): m_left(left), m_right(right) {}

  virtual double value() { return m_left->value() - m_right->value(); }

  virtual Minus* clone() { return new Minus(*this); }

  Minus &operator = (const Minus &other) {
    if(&other != this) {
      delete m_left;
      delete m_right;

      m_left = other.m_left->clone();
      m_right = other.m_right->clone();
    }
  }
};


class Times : public Expression {
  Expression *m_left;
  Expression *m_right;

public:
  Times(Expression *left, Expression *right): m_left(left), m_right(right) {}

  virtual double value() { return m_left->value() * m_right->value(); }

  virtual Times* clone() { return new Times(*this); }

  Times &operator = (const Times &other) {
    if(&other != this) {
      delete m_left;
      delete m_right;

      m_left = other.m_left->clone();
      m_right = other.m_right->clone();
    }
  }
};


class Divide : public Expression {
  Expression *m_left;
  Expression *m_right;

public:
  Divide(Expression *left, Expression *right): m_left(left), m_right(right) {}

  virtual double value() { return m_left->value() * m_right->value(); }

  virtual Divide* clone() { return new Divide(*this); }

  Divide &operator = (const Divide &other) {
    if(&other != this) {
      delete m_left;
      delete m_right;

      m_left = other.m_left->clone();
      m_right = other.m_right->clone();
    }
  }
};


class Negative : public Expression {
  Expression *m_expression;

public:
  Negative(Expression *expr): m_expression(expr) {}

  virtual double value() { return -m_expression->value(); }

  virtual Negative* clone() { return new Negative(*this); }

  Negative &operator = (const Negative &other) {
    if(&other != this) {
      delete m_expression;

      m_expression = other.m_expression->clone();
    }
  }
};


class Number : public Expression {
  double m_value;

public:
  Number(double value): m_value(value) {}

  virtual Number* clone() { return new Number(m_value); }

  virtual double value() { return (double)m_value; }
};
