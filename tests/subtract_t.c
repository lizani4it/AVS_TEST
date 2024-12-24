#include "operations/operations.h"
#include <assert.h>
#include <stdio.h>

void sub_test()
{
    assert(subtract(5, 4) == 1);
    assert(subtract(2, 3) == -1);
}

int main()
{
    int test_failed = 0;
    
    sub_test();
    return test_failed;
}