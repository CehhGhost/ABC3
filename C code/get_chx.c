extern double fact(int n);
extern double pow(double x, double n);
double get_chx(int x, double epsilon) {
    double sum = 0;
    double prev = -1;

    for (int i = 0; sum - prev > epsilon; ++i) {
        prev = sum;
        double res = pow(x, 2 * i) / fact(2 * i);
        sum += res;
    }
    return sum;
}
