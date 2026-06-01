# How many times does i  runs?
# For every iteration of i, how many times does j run?
# {
# end = ""
# end="\n
# "end=" "
# }
# Don't move to the next line after printing.

# for i in range(3):
#     for j in range(4):
#         print("*", end="")
#     print()
# Because print() automatically moves to a new line

# This Is Actually Linear Search

# I wrote is the basic version of the Linear Search algorithm.
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


# syntax important
    # for i in range(len(data)):
    # if condition:
    #     do_something
