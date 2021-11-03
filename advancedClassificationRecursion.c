#include <math.h>
#include "NumClass.h"

int revers(int n, int ans){
    if (n==0)
    {
        return ans;
    }       
    ans = (ans*10) + n%10;
    return (revers(n/10, ans));
    return 0;
}

int isPalindrome(int n){
    if (revers(n, 0) == n)
    {
        return 1;
    }
    return 0;
}

int helpArm(int n, double tmp, double len){
    if (n==0){
        return tmp;
    }
    int mod = n%10;
    double dMod = (double) mod;
    tmp += pow(dMod, len);
    return helpArm(n/10, tmp, len);
    return 0;
}

int isArmstrong(int n){
    double origin= (double) n;
    double len = floor(log10(origin)) + 1;
    if (helpArm(n , 0.0, len) == n)
    {
        return 1;
    }
    
    return 0;
}