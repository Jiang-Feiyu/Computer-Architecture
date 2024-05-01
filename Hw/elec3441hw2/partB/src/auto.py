import os
import subprocess
import csv

def run_command(command, target_path):
    process = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE, cwd=target_path)
    output, _ = process.communicate()
    return output.decode('utf-8')

def parse_output(output):
    result = {}
    lines = output.split("\n")
    for line in lines:
        # print(line)
        if line.startswith("couldn't open ELF program: "):
            result["couldn't open ELF program"] = line.split(":")[1].strip()
        elif line.startswith("L2$ Bytes Read:"):
            result["L2$ Bytes Read"] = line.split(":")[1].strip()
        elif line.startswith("L2$ Bytes Written:"):
            result["L2$ Bytes Written"] = line.split(":")[1].strip()
        elif line.startswith("L2$ Read Accesses:"):
            result["L2$ Read Accesses"] = line.split(":")[1].strip()
        elif line.startswith("L2$ Write Accesses:"):
            result["L2$ Write Accesses"] = line.split(":")[1].strip()
        elif line.startswith("L2$ Read Misses:"):
            result["L2$ Read Misses"] = line.split(":")[1].strip()
        elif line.startswith("L2$ Write Misses:"):
            result["L2$ Write Misses"] = line.split(":")[1].strip()
        elif line.startswith("L2$ Writebacks:"):
            result["L2$ Writebacks"] = line.split(":")[1].strip()
        elif line.startswith("L2$ Miss Rate:"):
            result["L2$ Miss Rate"] = line.split(":")[1].strip()
        elif line.startswith("D$ Bytes Read:"):
            result["D$ Bytes Read"] = line.split(":")[1].strip()
        elif line.startswith("D$ Bytes Written:"):
            result["D$ Bytes Written"] = line.split(":")[1].strip()
        elif line.startswith("D$ Read Accesses:"):
            result["D$ Read Accesses"] = line.split(":")[1].strip()
        elif line.startswith("D$ Write Accesses:"):
            result["D$ Write Accesses"] = line.split(":")[1].strip()
        elif line.startswith("D$ Read Misses:"):
            result["D$ Read Misses"] = line.split(":")[1].strip()
        elif line.startswith("D$ Write Misses:"):
            result["D$ Write Misses"] = line.split(":")[1].strip()
        elif line.startswith("D$ Writebacks:"):
            result["D$ Writebacks"] = line.split(":")[1].strip()
        elif line.startswith("D$ Miss Rate:"):
            result["D$ Miss Rate"] = line.split(":")[1].strip()
        elif line.startswith("I$ Bytes Read:"):
            result["I$ Bytes Read"] = line.split(":")[1].strip()
        elif line.startswith("I$ Bytes Written:"):
            result["I$ Bytes Written"] = line.split(":")[1].strip()
        elif line.startswith("I$ Read Accesses:"):
            result["I$ Read Accesses"] = line.split(":")[1].strip()
        elif line.startswith("I$ Write Accesses:"):
            result["I$ Write Accesses"] = line.split(":")[1].strip()
        elif line.startswith("I$ Read Misses:"):
            result["I$ Read Misses"] = line.split(":")[1].strip()
        elif line.startswith("I$ Write Misses:"):
            result["I$ Write Misses"] = line.split(":")[1].strip()
        elif line.startswith("I$ Writebacks:"):
            result["I$ Writebacks"] = line.split(":")[1].strip()
        elif line.startswith("I$ Miss Rate:"):
            result["I$ Miss Rate"] = line.split(":")[1].strip()
    
    return result

def write_to_csv(data):
    headers = data[0].keys()
    with open('result.csv', 'w', newline='') as file:
        writer = csv.DictWriter(file, fieldnames=headers)
        writer.writeheader()
        writer.writerows(data)

def process_folders():
    folders = [f for f in os.listdir('.') if os.path.isdir(f)]
    results = []
    
    current_path = os.getcwd()
        
    for folder in folders:
        subdirectory=f"/{folder}"
        target_path = current_path+subdirectory
        os.chdir(target_path)
        command_init = "make clean"
        command_make = "make"
        run_command(command_init, target_path)
        run_command(command_make, target_path)
        print("makefile finished")
        command = f"spike --ic=128:1:32 --dc=256:1:32 --l2=1024:2:128 pk {folder}"
        print(command)
        output = run_command(command, target_path)
        os.chdir(current_path)
        result = parse_output(output)
        results.append(result)
    
    write_to_csv(results)
    print("Output written to result.csv")
    
def main():
    process_folders()

if __name__ == "__main__":
    main()