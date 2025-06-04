int main(int N, char** argv) {
    int sum = 0;
    for(int i = 0; i < N; ++i) {
        for(int j = 0; j < 2* N; ++j) {
            if (i == j) {
                sum++;
            }
        }
    }
}