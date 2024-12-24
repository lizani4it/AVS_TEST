#include "operations/operations.h"
#include <assert.h>
#include <stdio.h>

void sum_test()
{
    assert(sum(5, 4) == 8);
    assert(sum(2, 3) == 5);
}

int main()
{
    int test_failed = 0;

    sum_test();
    return test_failed;
}