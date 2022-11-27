#include <stdio.h>
#include <stdlib.h>

extern double fact(int n);
extern double get_chx(int x, double epsilon);
extern double pow(double x, double n);

int main(int argc, char *argv[]) {
    int x;
    double epsilon;
    int seed;
    int flag;
    if (argc == 3) {
        FILE *input = fopen(argv[1], "r");
        if (input == NULL) {
            printf("File Opening Error\n");
            return 1;
        }
        fscanf(input, "%d%lf", &x, &epsilon);
        fclose(input);
        FILE *output = fopen(argv[2], "w");
        if (output == NULL) {
            printf("File Opening Error\n");
            return 1;
        }
        fprintf(output, "Your ch(x) = %lf\r\n", get_chx(x, epsilon));
	fclose(output);
        return 0;
    }
    printf("Choose input: manual or random(0 = manual; other = random):\r\n");
    scanf("%d", &flag);
    if (flag == 0) {
        printf("\n");
        printf("Set your x(>0 && <= %d)\r\n", 10);
        scanf("%d", &x);
        if (x < 1 || x > 10) {
            printf("x is out of range\r\n");
            return 1;
        }
        printf("Set your epsilon(>= %lf && <= 0.001)\r\n", 0.000001);
        scanf("%lf", &epsilon);
        if (epsilon < 0.000001 || epsilon > 0.001) {
            printf("epsilon is out of range\r\n");
            return 1;
        }
        printf("Your ch(x) = %lf\r\n", get_chx(x, epsilon));
        return 0;
    }
    printf("Choose seed generation(>0 && <= 100):\r\n");
    scanf("%d", &seed);
    if (seed < 1 || seed > 100) {
        printf("Seed is out of range\r\n");
        return 1;
    }
    srand(seed);
    x = rand() % 11;
    epsilon = 1.0 / (pow(10,(rand() % 4 + 3)));
    printf("x: = %d \r\n", x);
    printf("epsilon: = %lf \r\n", epsilon);
    printf("Your ch(x) = %lf\r\n", get_chx(x, epsilon));
    return 0;
}
