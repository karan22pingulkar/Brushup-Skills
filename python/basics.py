# Print numbers from 1 to 10.
for i in range(1, 11):
    print(i)
# Print numbers from 10 to 1.
print("--------------------------------------------------- % ")
num = 10
while num >= 1:
    print(num)
    num -= 1
# Print even numbers from 1 to 20.
print("--------------------------------------------------- % ")
for i in range(1, 21):
    if i % 2 == 0:
        print(i)
# Print odd numbers from 1 to 20.
print("--------------------------------------------------- % ")
for i in range(1, 21):
    if i % 2 != 0:
        print(i)

# Find the sum of numbers from 1 to 100.
print("--------------------------------------------------- % ")
sum = 0
for i in range(1, 101):
    sum = sum + i
print(sum)
print("--------------------------------------------------- % ")
# Find the sum of even numbers from 1 to 20.
sum = 0
for i in range(1, 21):
    if i % 2 == 0:
        sum = sum + i
print(sum)
print("--------------------------------------------------- % ")
# Print the multiplication table of 5.
for i in range(1, 11):
    res = 5*i
    print(f"5 x {i} = {res}")
print("--------------------------------------------------- % ")
# Count how many numbers are in this list:
nums = [5, 2, 8, 1, 9, 6]
count = 0
for i in nums:
    count += 1
print(count)
print("--------------------------------------------------- % ")
# Find the largest number:
nums = [5, 2, 8, 1, 9, 6]
large = nums[0]

for num in nums:
    if num > large:
        large = num

print(large)

print("--------------------------------------------------- % ")
# Problem 1: Smallest Number
nums = [5, 2, 8, 1, 9, 6]
small = nums[0]
for num in nums:
    if num < small:
        small = num

print(small)
print("--------------------------------------------------- % ")
# Problem 2: Count Even Numbers
nums = [5, 2, 8, 1, 9, 6]
count_even = 0
for num in nums:
    if num % 2 == 0:
        count_even += 1

print(count_even)
print("--------------------------------------------------- % ")

# Problem 3: Sum of List
nums = [5, 2, 8, 1, 9, 6]
list_sum = 0
for num in nums:
    list_sum = num + list_sum
print(list_sum)
# tip:accumulator = accumulator + value somtimes we can come across accumulator =  value +  accumulator  in reverse string ig

print("--------------------------------------------------- % ")
# Problem 4: Find if Number Exists
nums = [5, 2, 8, 1, 9, 6]
output = 8

if output in nums:
    print(f"{output} exists")
else:
    print(f"{output} doesnt exists")

# 2 method
print("--------------------------------------------------- % ")
nums = [5, 2, 8, 1, 9, 6]
output = 8
found = False  # Start by assuming it is not there

for num in nums:
    if num == output:
        found = True
        break  # Stop searching immediately once found

if found:
    print(f"{output} exists")
else:
    print(f"{output} doesnt exists")

# ✅ Variables

# ✅ Arithmetic operators

# ✅ Comparison operators

# ✅ if / elif / else

# ✅ for loops

# ✅ while loops

# ✅ Lists

# ✅ Traversing a list

# ✅ Sum pattern

# ✅ Count pattern

# ✅ Maximum pattern

# ✅ Minimum pattern

# ✅ Linear Search

# ✅ break
