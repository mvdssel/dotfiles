#include <iostream>
    using std::cout;
    using std::cin;
    using std::endl;
#include <iomanip>
    using std::setw;
    using std::setfill;
#include <string>
    using std::string;
#include <thread>
    using std::this_thread::sleep_for;
#include <chrono>
    using namespace std::chrono;

/**
 * Function which shifts alfabetical chars in string *input* a certain amount, while
 * keeping the character alfabetical.
 */
void shift_chars(const string &input, const int offset, string &output);

int main(int argc, char *argv[]) {
    string input, output;

    // join all command line arguments into one string
    if(argc > 1) {
        for(int i=1; i<argc; i++) {
            input += argv[i];
            input += " ";
        }
    }
    // or ask for a sentance to be encrypted
    else {
        cout << "Enter information that should be encrypted:\n> ";
        getline(cin, input);
    }

    cout << "< Starting encryption process:" << endl;
    steady_clock::time_point t1, t2;
    t1 = steady_clock::now();
    for(int i=0; i<=26; i++) {
        shift_chars(input, i, output);
        cout << "+" << setw(2) << setfill('0') << i << " / -" << setw(2) << setfill('0') << (26 - i) << "\t" << output << endl;
    }
    t2 = steady_clock::now();

    duration <double> time_span = duration_cast <duration<double> > (t2 - t1);
    cout << "< Message fully encrypted after " << time_span.count() << " seconds." << endl;

    return 0;
}


void shift_chars(const string &input, const int offset, string &output) {
    output = "";

    for(int i=0; i<input.length(); i++) {
        char c = input[i];
        // Geen leestekens verschuiven
        if(isalpha(c)) {
            if(islower(c)) {
                c -= 'a';
                c = (c + offset) % 26;
                c += 'a';
            }
            else {
                c -= 'A';
                c = (c + offset) % 26;
                c += 'A';
            }
        }
        output += c;
    }
}
