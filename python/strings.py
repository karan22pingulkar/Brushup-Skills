
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

print("# ------------------------------------------------------------------------------")
# A palindrome is a word that reads the same forwards and backwards.
# check if palindrome
word = "level"

reverse = ""

for i in word:
    reverse = i + reverse

if reverse == word:
    print("palindrome")
else:
    print("not a palindrome")

print("# ------------------------------------------------------------------------------")

# Count vowels.
word = "programming"
count = 0
for i in word:
    if i not in "aeiou":
        pass
    else:
        count += 1
print(count)

print("# ------------------------------------------------------------------------------")


# Count how many times each character appears
word = "banana"

count_b = 0

count_a = 0

count_n = 0

no_repeat = False
for i in range(len(word)):
    if word[i] == "b":
        count_b += 1
    elif word[i] == "a":
        count_a += 1
    elif word[i] == "n":
        count_n += 1
    else:
        no_repeat = True
if no_repeat:
    print("no character repeated")
else:
    print(f"a-->{count_a}\nb-->{count_b}\nn-->{count_n}")


print("# ------------------------------------------------------------------------------")
# without hardcoded a b n
word = "banana"

# for ch in word:
#     count = 0

#     for letter in word:
#         if letter == ch:
#             count += 1

#     print(ch, "->", count)
