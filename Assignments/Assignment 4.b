#include <stdio.h>
#include <stdlib.h>
struct Node
{
    int data;
    struct Node *left;
    struct Node *right;
};
struct Node* newNode(int value)
{
    struct Node *p=malloc(sizeof(struct Node));
    p->data=value;
    p->left=NULL;
    p->right=NULL;
    return p;
}
struct Node* insert(struct Node *root, int value)
{
    if(root==NULL)
        return newNode(value);
    if(value<root->data)
        root->left=insert(root->left, value);
    else
        root->right=insert(root->right, value);
    return root;
}
struct Node* smallest(struct Node *root)
{
    while(root->left!=NULL)
        root=root->left;
    return root;
}
struct Node* deleteNode(struct Node *root, int value)
{
    struct Node *temp;
    if(root==NULL)
        return root;
    if(value<root->data)
        root->left = deleteNode(root->left, value);
    else if(value>root->data)
        root->right=deleteNode(root->right, value);
    else
    {
        if(root->left==NULL)
        {
            temp=root->right;
            free(root);
            return temp;
        }
        if(root->right==NULL)
        {
            temp=root->left;
            free(root);
            return temp;
        }
        temp=smallest(root->right);
        root->data=temp->data;
        root->right=deleteNode(root->right, temp->data);
    }
    return root;
}
void inorder(struct Node *root)
{
    if(root!=NULL)
    {
        inorder(root->left);
        printf("%d ",root->data);
        inorder(root->right);
    }
}
int main()
{
    int a[]={40,20,60,10,30,50,70};
    struct Node *root=NULL;
    int i;
    for(i = 0;i < 7;i++)
        root=insert(root, a[i]);
    printf("Original tree: ");
    inorder(root);
    root=deleteNode(root, 10);
    printf("\nAfter deleting 10: ");
    inorder(root);
    root=deleteNode(root, 20);
    printf("\nAfter deleting 20: ");
    inorder(root);
    root=deleteNode(root, 40);
    printf("\nAfter deleting 40: ");
    inorder(root);
}
