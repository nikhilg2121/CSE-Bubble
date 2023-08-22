#include<bits/stdc++.h>
using namespace std;

int main(){
    int arr[] = {10, 5, 4, 9, 8, 6, 2, 1, 3, 0, 7};

    int n = 10;

    for(int j = n-1; j>=1; j--)
        for(int i = 1; i<=j; i++){
            if(arr[i]>arr[i+1]){
                swap(arr[i],arr[i+1]);
            }
        }

    return 0;
}