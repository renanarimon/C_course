#include "NumClass.h"
#include <math.h>

int isPalindrome(int n){
    int origin = n;
    int revers =0;
    while (n>0)
    {        
        revers += n%10;
        n = n/10;
        if (n>0)
        {
            revers *= 10;
        }  
    }
    if (origin == revers)
    {
        return 1;
    }
    return 0;
}

int isArmstrong(int n){
    int origin = n;
    int len = floor(log10(n)) + 1;
    int ans = 0;
    while (n>0)
    {
        ans += pow(n%10, len);
        n = n/10;
    }
    if (ans == origin)
    {
        return 1;
    }    
    return 0;
}

