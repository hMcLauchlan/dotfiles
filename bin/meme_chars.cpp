#include <bits/stdc++.h>

using namespace std;

void print_one(const vector<string> &ch) {
  for (const string &s : ch) {
    cout << s << endl;
  }
  cout << endl;
}

void print_one_per_line(const string &line,
                        const vector<vector<string>> &chars) {
  for (char c : line) {
    if (c > 'Z') c = c - 'z' + 'Z';
    assert(c >= 'A' && c <= 'Z');
    print_one(chars[c - 'A']);
  }
}

void print_line(const string &line, const vector<vector<string>> &chars) {
  vector<string> output(7);
  for (char c : line) {
    if (c > 'Z') c = c - 'z' + 'Z';
    assert(c >= 'A' && c <= 'Z');
    for (int i = 0; i < 7; ++i) {
      output[i] += chars[c - 'A'][i];
      for (int j = 0; j + chars[c - 'A'][i].size() <= 7; ++j) {
        output[i] += ' ';
      }
    }
  }
  for (const string &row : output) {
    cout << row << endl;
  }
}

int main() {
  string home = getenv("HOME");

  ifstream fin((home + "/bin/big_chars.txt").c_str());
  string line;
  int idx = -1;
  int row = 0;
  vector<vector<string>> chars(26, vector<string>(7));
  while (getline(fin, line)) {
    if (line == "SPLIT") {
      idx++;
      row = 0;
    } else {
      chars[idx][row] = line;
      ++row;
    }
  }

  getline(cin, line);
  stringstream ss(line);

  cout << "```" << endl;
  string token;
  while (ss >> token) {
    print_line(token, chars);
    cout << endl;
  }
  cout << "```" << endl;
  // print_one_per_line(line, chars);
}
