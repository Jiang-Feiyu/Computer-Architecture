#!/usr/bin/env python3

import math

# Raw and normalized CPU times for benchmark programs
benchmark_data = {
	'Proc.A': {'raw time': [20000, 80000, 40000, 12000000], 'norm time': [1, 1, 1,1]},
	'Proc.B': {'raw time': [40000, 20000, 80000, 24000000], 'norm time': [2, 0.25, 2,2]},
	'Proc.C': {'raw time': [80000, 40000, 20000, 6000000], 'norm time': [4, 0.5, 0.5,0.5]}
}

# Calculate arithmetic mean of normalized CPU time
arithmetic_mean = {}
for processor, data in benchmark_data.items():
	normalized_times = data['norm time']
	arithmetic_mean[processor] = sum(normalized_times) / len(normalized_times)
	
# Calculate geometric mean of normalized CPU time
geometric_mean = {}
for processor, data in benchmark_data.items():
	normalized_times = data['norm time']
	product = 1
	for time in normalized_times:
		product *= time
	geometric_mean[processor] = math.pow(product, 1 / len(normalized_times))
	
# Print results
print("Arithmetic Mean of Normalized CPU Time:")
for processor, mean in arithmetic_mean.items():
	print(processor + ":", mean)
	
print("\nGeometric Mean of Normalized CPU Time:")
for processor, mean in geometric_mean.items():
	print(processor + ":", mean)

# Calculate total raw CPU time (Proc.A)
total_raw_time_A = sum(benchmark_data['Proc.A']['raw time'])

# Calculate total normalized CPU time (Proc.A)
total_norm_time_A = sum(benchmark_data['Proc.A']['norm time'])

# Calculate total raw CPU time (Proc.B)
total_raw_time_B = sum(benchmark_data['Proc.B']['raw time'])

# Calculate total normalized CPU time (Proc.B)
total_norm_time_B = sum(benchmark_data['Proc.B']['norm time'])

# Calculate total raw CPU time (Proc.C)
total_raw_time_C = sum(benchmark_data['Proc.C']['raw time'])

# Calculate total normalized CPU time (Proc.C)
total_norm_time_C = sum(benchmark_data['Proc.C']['norm time'])

# Print results
print("Total Raw CPU Time (Proc.A):", total_raw_time_A)
print("Total Normalized CPU Time (Proc.A):", total_norm_time_A)
print("Total Raw CPU Time (Proc.B):", total_raw_time_B)
print("Total Normalized CPU Time (Proc.B):", total_norm_time_B)
print("Total Raw CPU Time (Proc.C):", total_raw_time_C)
print("Total Normalized CPU Time (Proc.C):", total_norm_time_C)