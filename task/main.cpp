#include <iostream>

using namespace std;
int main()
{

    int i, j;
    int **arr = new int *[1000];
    for (i = 0; i < 1000; ++i)
    {
        arr[i] = new int[1000];
        for (j = 0; j < 1000; ++j)
            arr[i][j] = i;
    }
    // row
    /*
    for (i = 0; i < 1000; ++i)
    {
        for (j =0; j < 1000; ++j)
            cout << arr[i][j] << " ";
        cout << "\n";
    }
    */
    // col
    for (i = 0; i < 1000; ++i)
    {
        for (j =0; j < 1000; ++j)
            cout << arr[j][i] << " ";
        cout << "\n";
    }
    return 0;
}
