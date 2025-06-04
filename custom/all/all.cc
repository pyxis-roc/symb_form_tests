int main(){
    if (true) {
        for (int i = 0; i < 3; ++i) {
            int count = 0;
            
            if (i % 2 == 0) {
                while (count < 2) {
                    // Nested logic example
                    ++count;
                }
            } else {
                // Other branch logic
            }
        }
    }
}