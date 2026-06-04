
# Count how many times 'n' in word = "banana"
# ------------------------------------------------------------------------------
word = "banana"
count = 0
for i in word:
    if i == "n":
        count += 1
print(count)


print("# ------------------------------------------------------------------------------")
# word = "hello"
# print
# 0 h
# 1 e
# 2 l
# 3 l
# 4 o
word = "hello"

for i in range(len(word)):
    print(f"{i}  {word[i]}")

print("# ------------------------------------------------------------------------------")
# word = "hello"
# REVERSE below string

word = "python"

output = ""
for i in word:
    output = i + output
print(output)
