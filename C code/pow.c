double pow(double x, double n) {
    double res = 1;
    for (int i = 0; i < n; ++i) {
        res *= x;
    }
    return res;
}
