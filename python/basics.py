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
nums = [5, 2, 8, 1, 9]
count = 0
for i in nums:
    count += 1
print(count)
print("--------------------------------------------------- % ")
# Find the largest number:
nums = [5, 2, 8, 1, 9]
