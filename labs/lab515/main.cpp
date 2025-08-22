#include <iostream>
#include <fstream>
#include <string>

using namespace std;

int main() 
{
    string fileName;

    // Get the name of the input file
    cin >> fileName;

    // Open the input file - look in the labs/lab515 directory
    string filePath = "labs/lab515/" + fileName;
    ifstream file(filePath);

    // Print contents of input file
    if(file.is_open()) {
        cout << file.rdbuf();
    } else {
        cout << "Error: Could not open file '" << filePath << "'" << endl;
    }

    // Close the input file
    file.close();

    return 0;
}
