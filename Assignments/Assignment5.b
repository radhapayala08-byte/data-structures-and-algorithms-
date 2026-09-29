#include <stdio.h>
int main()
{
    int cost[5][5] = {
        {0, 4, 2, 99, 99},
        {4, 0, 1, 5, 99},
        {2, 1, 0, 8, 10},
        {99, 5, 8, 0, 2},
        {99, 99, 10, 2, 0}
    };
    int dist[5] = {0, 4, 2, 99, 99};
    int visited[5] = {1, 0, 0, 0, 0};
    int i, j, min, v;
    for (i = 1; i < 5; i++)
    {
        min = 99;
        for (j = 0; j < 5; j++)
        {
            if (visited[j] == 0 && dist[j] < min)
            {
                min = dist[j];
                v = j;
            }
        }
        visited[v] = 1;
        for (j = 0; j < 5; j++)
        {
            if (visited[j] == 0 && dist[v] + cost[v][j] < dist[j])
            {
                dist[j] = dist[v] + cost[v][j];
            }
        }
    }
    printf("Shortest distances from A:\n");
    printf("A to A = %d\n", dist[0]);
    printf("A to B = %d\n", dist[1]);
    printf("A to C = %d\n", dist[2]);
    printf("A to D = %d\n", dist[3]);
    printf("A to E = %d\n", dist[4]);
}
