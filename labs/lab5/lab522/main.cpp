#include <iostream>
using namespace std;

void firstInput(int baseNum)
{
    cout << "You entered: " << baseNum << endl;
    cout << baseNum<< " squared is " << (baseNum * baseNum) << endl;
    cout << "And " << baseNum << " cubed is " << (baseNum * baseNum * baseNum) << "!!" << endl;
}

int main() {
    int userNum;
    int userNum2;

    cout << "Enter integer:" << endl;
    cin >> userNum;
    firstInput(userNum);

    cout << "Enter another integer:" << endl;
    cin >> userNum2;

    cout << userNum << " + " << userNum2 << " is " << (userNum + userNum2) << endl;
    cout << userNum << " * " << userNum2 << " is " << (userNum * userNum2) << endl;

   return 0;
}
