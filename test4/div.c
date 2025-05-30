#include <stdio.h>

int main() {
    int num1, num2;
    float result;
    printf("Enter dividend: ");
    scanf("%d", &num1);

    printf("Enter divisor: ");
    scanf("%d", &num2);
    if (num2 == 0) {
        printf("Error: Division by zero is not allowed.\n");
    } else {
        result = (float)num1 / num2;
        printf("The result of %d / %d is %.2f\n", num1, num2, result);
    }

    return 0;
}
