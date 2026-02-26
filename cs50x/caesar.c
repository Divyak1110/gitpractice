#include <cs50.h>
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, string argv[])
{
    // Check number of arguments
    if (argc != 2)
    {
        printf("Usage: ./caesar key\n");
        return 1;
    }

    // Ensure key is numeric
    for (int i = 0; i < strlen(argv[1]); i++)
    {
        if (!isdigit(argv[1][i]))
        {
            printf("Usage: ./caesar key\n");
            return 1;
        }
    }

    // Convert to integer
    int key = atoi(argv[1]);

    // Get plaintext
    string plaintext = get_string("plaintext: ");

    // Encrypt
    printf("ciphertext: ");
    for (int i = 0; i < strlen(plaintext); i++)
    {
        char c = plaintext[i];
        if (isalpha(c))
        {
            char base = isupper(c) ? 'A' : 'a';
            printf("%c", (c - base + key) % 26 + base);
        }
        else
        {
            printf("%c", c);
        }
    }
    printf("\n");
}
