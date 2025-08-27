#include <iostream>
#include <string>
using namespace std;

string baseOutput(int baseDigit) {
    string result = "";
    for (int i = 0; i < 5; i++) {
        result += to_string(baseDigit);
    }
    return result;
}

int main() 
{
    int baseDigit, headDigit;
    
    // Read the two integers
    cin >> baseDigit >> headDigit;
    
    cout << "     " << headDigit << endl;
    cout << "     " << headDigit << headDigit << endl;
    cout << baseOutput(baseDigit) << headDigit << headDigit << headDigit << endl;
    cout << baseOutput(baseDigit) << headDigit << headDigit << headDigit << headDigit << endl;
    cout << baseOutput(baseDigit) << headDigit << headDigit << headDigit << endl;
    cout << "     " << headDigit << headDigit << endl;
    cout << "     " << headDigit << endl;
    
    return 0;
}
