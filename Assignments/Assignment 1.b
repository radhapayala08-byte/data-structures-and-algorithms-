#include <stdio.h>
int main()
{
    int keys[]={23, 43, 13, 27, 37, 53};
    int table[10];
    int i,index;
    for(i = 0;i < 10;i++)
        table[i]=-1;
    for(i = 0; i<6; i++)
    {
        index=keys[i] % 10;
        while(table[index]!=-1)
            index=(index + 1) % 10;
        table[index]=keys[i];
    }
    printf("Hash Table using Linear Probing:\n");
    for(i = 0;i < 10;i++)
    {
        if(table[i]==-1)
            printf("%d : Empty\n",i);
        else
            printf("%d : %d\n",i,table[i]);
    }
}
