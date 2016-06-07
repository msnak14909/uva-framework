#include<iostream>
#include<cstdio>
#include<stack>
using namespace std;
const int MAXN = 1000 + 10;
int target[MAXN];
int N;
int main()
{
  while(scanf("%d", &N) == 1 && N != 0) {
    int exit = 0;
    while(!exit) {
      stack<int> s;
      int A = 1, B =1;
      for(int i = 1; i <= N; i++) {
        scanf("%d", &target[i]);
        if (target[i] == 0) {
          exit = 1;
          break;
        }
      }
      if(!exit) {
        int ok = 1;
        while (B <= N) {
          if (A == target[B]) {
            A++;
            B++;
          }
          else if (!s.empty() && s.top() == target[B]) {
            s.pop();
            B++;
          }
          else if (A <= N) s.push(A++);
          else {
            ok = 0;
            break;
          }
        }
        printf("%s\n", ok ? "Yes" : "No");
      }
      else puts("");
    }
  }
  return 0;
}

