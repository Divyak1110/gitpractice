while True:
    cents = input("Change owed: ")
    try:
        cents_float = float(cents)
        if cents_float > 0:
            break
        else:
            print("Invalid! Enter a positive amount.")
    except ValueError:
        print("Invalid! Enter a numeric value.")

# convert dollars to cents (integer)
cents_int = round(cents_float * 100)

# calculate coins
quarters = cents_int // 25
cents_remaining = cents_int % 25

dimes = cents_remaining // 10
cents_remaining = cents_remaining % 10

nickels = cents_remaining // 5
cents_remaining = cents_remaining % 5

pennies = cents_remaining  # remaining cents are pennies

total_coins = quarters + dimes + nickels + pennies
print(total_coins)
