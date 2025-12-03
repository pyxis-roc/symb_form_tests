#include <iostream>
#include <chrono>

// Replace this with your actual kernel function signature
extern "C" long long kernel(long long K, long long N);

int main() {
    constexpr int M = 128, N = 128, K = 128;
    constexpr int runs = 30000;

    // Warm up
    kernel(K, N);

    auto start = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < runs; ++i) {
        kernel(K, N);
    }
    auto end = std::chrono::high_resolution_clock::now();

    double total_us = std::chrono::duration<double, std::micro>(end - start).count();
    std::cout << "Average time per run: " << (total_us / runs) << " us" << std::endl;
    return 0;
}