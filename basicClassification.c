#include "NumClass.h"

int isPrime(int n){
    if (n==0 || n==1)
    {
        return 0;
    }
    for (int i = n/2; i > 1; i--)
    {
        if (n%i==0)
        {
            return 0;
        }
        
    }
    return 1;
    
}


int fact(int n){
        int ans = 1;
        for (int i=2; i<=n; i++){
            ans*=i;
        }
        return ans;
    }

int isStrong(int n) {
    int copy = n;
    int ans = 0;
    while (copy > 0) {
        ans += fact(copy % 10) ;
        copy = copy / 10;
    }

    if (ans == n) {
        return 1;
    }

    return 0;

}