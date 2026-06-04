# ==============================================================================
# 🔄 NESTED LOOPS & PRINT MECHANICS
# ==============================================================================
# Q: How many times does i run?
#    -> 3 times (0, 1, 2)
#
# Q: For every iteration of i, how many times does j run?
#    -> 4 times (0, 1, 2, 3)
#
# Total star prints = 3 * 4 = 12 times.
# ------------------------------------------------------------------------------
# 💡 Print Syntax Notes:
# end=""   -> Don't move to the next line after printing (keeps it on the same line).
# end="\n" -> Moves to a new line (this is the default behavior of print()).
# end=" "  -> Adds a space after the print instead of a newline.
# ------------------------------------------------------------------------------

# for i in range(3):
#     for j in range(4):
#         print("*", end="")  # Keeps stars side-by-side on the same line
#     print()                 # Because empty print() automatically moves to a new line


# ==============================================================================
# 🔍 SEARCH ALGORITHMS
# ==============================================================================
# Note: This is the basic, foundational version of the Linear Search algorithm.
# It checks every single element sequentially from start to finish.

# This Is Actually Linear Search
nums = [10, 20, 30, 40]
for i in range(len(nums)):
    if nums[i] == 30:
        print(i)

# write code that finds all occurrences of a number?
nums = [10, 30, 20, 30, 40, 30]
target = 30

for i in range(len(nums)):
    if nums[i] == target:
        print(f"Found at index {i}")


# ==============================================================================
#  CORE SYNTAX REFERENCE
# ==============================================================================
# Important structure note:
# for i in range(len(data)):
#     if condition:
#         do_something


# ==============================================================================
#  ALGORITHM PATTERNS
# ==============================================================================

# ------------------------------------------------------------------------------
# Pattern 1: Count
# ------------------------------------------------------------------------------
# count = 0
# for num in nums:
#     if num % 2 == 0:
#         count += 1


# ------------------------------------------------------------------------------
# Pattern 2: Sum
# ------------------------------------------------------------------------------
# total = 0
#
# for num in nums:
#     total += num


# ------------------------------------------------------------------------------
# Pattern 3: Find Maximum
# ------------------------------------------------------------------------------
# largest = nums[0]
#
# for num in nums:
#     if num > largest:
#         largest = num


# ------------------------------------------------------------------------------
# Pattern 4: Find Minimum
# ------------------------------------------------------------------------------
# smallest = nums[0]
#
# for num in nums:
#     if num < smallest:
#         smallest = num


# ------------------------------------------------------------------------------
# Pattern 5: Search
# ------------------------------------------------------------------------------
# for i in range(len(nums)):
#     if nums[i] == target:
#         print(i)
# ------------------------------------------------------------------------------

# Append

nums = [10, 20]
nums.append(30)
nums.append(40)
nums.append(50)
print(nums)
print("# ------------------------------------------------------------------------------")

#  OR Add multiple items at once
# .extend() method takes an entire list of items and dumps them all into your original list one by one.
nums = [10, 20, 30]
nums.extend([40, 50, 60])
print(nums)

nums = [10, 20, 30, 40]
nums.pop()
nums.pop()
print(nums)
print("# ------------------------------------------------------------------------------")

nums = []

for i in range(1, 6):
    nums.append(i*i)

print(nums)
print("# ------------------------------------------------------------------------------")

# Start Thinking in Indices
# for i in range(len(nums)):
# Print every pair of neighboring elements:
# desired o/p-->
# 5 8
# 8 3
# 3 9
# 9 2
nums = [5, 8, 3, 9, 2]
for i in range(len(nums)-1):
    print(nums[i], nums[i+1])
print("# ------------------------------------------------------------------------------")
# Challenge 1: Count Increasing Pairs
nums = [5, 8, 3, 9, 2]
count = 0
for i in range(len(nums)-1):
    if nums[i] < nums[i+1]:
        count += 1

print(count)
print("# ------------------------------------------------------------------------------")

# Challenge 2: Find Adjacent Equal Values

nums = [1, 2, 2, 4, 5]
for i in range(len(nums)-1):
    if nums[i] == nums[i+1]:
        print(f"Found adjacent equal values {nums[i]} and  {nums[i+1]}")

print("# ------------------------------------------------------------------------------")

# Challenge 3 (First Mini Interview Question)
# Find the difference between every neighboring pair.
nums = [5, 8, 3, 9, 2]

for i in range(len(nums)-1):
    print(nums[i+1]-nums[i])


user_choice = int(input("enter number :"))

if user_choice <= 1:
    print("not prime")
else:
    is_prime = True

    for i in range(2, user_choice):
        if user_choice % i == 0:
            is_prime = False
            break

    if is_prime:
        print("prime")
    else:
        print("not prime")

print("# ------------------------------------------------------------------------------")
# Using nested loops, check if the list contains any duplicate values.
nums = [5, 8, 3, 5]

for i in range(len(nums)):
    for j in range(i+1, len(nums)):
        if nums[i] == nums[j]:
            print("Duplicate Found")

# Using nested loops, check if the list contains any duplicate values  using break statement if we found any one duplciate we stop.
nums = [5, 8, 3, 5, 6, 5]
found = False
for i in range(len(nums)):
    for j in range(i+1, len(nums)):
        if nums[i] == nums[j]:
            found = True
            break
    if found:
        break

if found:
    print("Duplicate Found using")
else:
    print("No Duplicate")
