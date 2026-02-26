def print_row(spaces, bricks):
    # print leading spaces
    print(" " * spaces, end="")

    # print left pyramid bricks
    print("#" * bricks, end="")

    # print gap
    print("  ", end="")  # two spaces

    # print right pyramid bricks
    print("#" * bricks)


# 1. Get valid height
while True:
    height = input("Enter height between 1 and 8: ")

    # Check if input is numeric
    if height.isnumeric():
        height_int = int(height)
        # Check if in valid range
        if 1 <= height_int <= 8:
            break   # valid input, exit loop
    print("Invalid! Enter height between 1 and 8: ")

# 2. Print the pyramid row by row
for i in range(1, height_int + 1):
    spaces = height_int - i        # leading spaces for right alignment
    bricks = i                     # number of bricks
    print_row(spaces, bricks)
