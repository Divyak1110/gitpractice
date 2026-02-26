#include <cs50.h>
#include <stdio.h>

void print_row(int spaces, int bricks);

int main(void)
{
    // prompt user for input
    int height;

    do
    {

        height = get_int("Enter the height of the pyramid(1 - 8)? \n");
    }

    while (height < 1 || height > 8);

    // print a height of the pyramid
    {
        for (int i = 0; i < height; i++)
        {
            int spaces = height - (i + 1); // leading spaces
            int bricks = i + 1;            // bricks in this row
            print_row(spaces, bricks);
        }
    }
}

void print_row(int spaces, int bricks)
{

    // print spaces
    for (int i = 0; i < spaces; i++)
    {
        printf(" ");
    }
    // print bricks
    for (int i = 0; i < bricks; i++)
    {
        printf("#");
    }
    // print gap
    printf("  ");
    // print bricks
    for (int i = 0; i < bricks; i++)
    {
        printf("#");
    }
    printf("\n"); // prints newline
}
