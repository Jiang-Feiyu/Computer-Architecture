#!/usr/bin/env python3

import math

# Raw CPU times for benchmark programs
benchmark_data = {
	'Proc.A': [20000, 80000, 40000, 1200, 12000000, 1000000000],
	'Proc.B': [40000, 20000, 80000, 2400, 24000000, 1],
	'Proc.C': [80000, 40000, 20000, 600, 6000000, 1000000000],
}

# Calculate arithmetic mean
arithmetic_mean = {}
for processor, raw_times in benchmark_data.items():
	arithmetic_mean[processor] = sum(raw_times) / len(raw_times)
	
# Calculate geometric mean
geometric_mean = {}
for processor, raw_times in benchmark_data.items():
	product = 1
	for time in raw_times:
		product *= time
	geometric_mean[processor] = math.pow(product, 1 / len(raw_times))
	
# Print results
print("Arithmetic Mean:")
for processor, mean in arithmetic_mean.items():
	print(processor + ":", mean)
	
print("\nGeometric Mean:")
for processor, mean in geometric_mean.items():
	print(processor + ":", mean)