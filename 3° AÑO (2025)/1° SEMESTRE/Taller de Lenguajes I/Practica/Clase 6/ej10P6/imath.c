#include <stdio.h>
#include "imath.h"

int potencia(int x, int y) {
  int res = 1;
  int i;
  for (i = 0; i < y; i++) {
    res *= x;
  }
  return res;
}

int cuadrado(int x) {
  return potencia(x,2);
}

int cubo(int x) {
  return potencia(x,3);
}

int absoluto(int i) {
  if (i < 0) i *= -1;
  return i;
}

int factorial(int i) {
  int res = i;
  int j;
  for (j = i - 1; j > 1; j--) {
    res *= j;
  }
  return res;
}

int sumatoria(int i) {
  int res = 0;
  int j;
  for (j = 1; j <= i; j++) {
    res += j;
  }
}

int multlipo(int x, int y) {
  if (x % y == 0) return 1;
  return 0;
}

int divisor(int x, int y) {
  if (y % x == 0) return 1;
  return 0;
}

int par(int i) {
  if (i % 2 == 0) return 1;
  return 0;
}

int impar(int i) {
  if (par(i)) return 0;
  return 1;
}
