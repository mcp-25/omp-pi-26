#include "student.h"
#include <stdlib.h>
#include <omp.h>

/* Parallelize this implementation. You may add includes and helper functions. */
static double get_rand_minus_one_one(void)
{
    return 2 * (rand() / (double)RAND_MAX) - 1;
}

double student_pi(long num_trials)
{
    long Ncirc = 0;
    for (long i = 0; i < num_trials; ++i) {
        double x = get_rand_minus_one_one();
        double y = get_rand_minus_one_one();
        if (x*x + y*y <= 1.0)
            ++Ncirc;
    }
    return 4.0 * (double)Ncirc / (double)num_trials;
}
