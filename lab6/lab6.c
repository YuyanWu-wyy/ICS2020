#include <conio.h>
#include <stdlib.h>
#include<stdio.h>
#include <pthread.h>  
#include <time.h>
#include <windows.h>
void lab02(){
	int a,b,c;
	printf("请输入两个数字用‘，’分隔：\n");
	scanf("%d,%d",&a,&b);
	if(a<b){
		c=a;
		a=b;
		b=c;
	}
	while(b!=0){
		c=a%b; a=b;  b=c;
	}
	printf("最大公约数为：%d \n",a);
	return;
} 
typedef struct link_list{
	int value;
	struct link_list *next;
}LINK;
void lab03(){
	int n,i,j;
	struct link_list *head,*p,*pf,*pb,temp;
	head=(struct link_list*)malloc(sizeof(struct link_list));//创建头结点
    p=(struct link_list*)malloc(sizeof(struct link_list));//申请第一个结点
    head->next=p;
    printf("How many numbers do you want to input:");
    scanf("%d",&n);
    printf("Please input numbers:\n");
    for(i=0;i<n;i++)
    {
        scanf("%d",&p->value);
        if(i==n-1){
        	p->next=NULL;
        	break;
		}
        p->next=(struct link_list*)malloc(sizeof(struct link_list));//申请下一个节点
        p=p->next;//将该节点和下一个节点连起来
    }
   
    pf=head->next;
    while(pf->next!=NULL){
    	pb = pf->next;//pb从基准点的下一个节点开始
        while(pb != NULL) {
            if(pf->value > pb->value) {
                temp = *pf;
                *pf = *pb;
                *pb = temp;
                temp.next = pf->next;
                pf->next = pb->next;
                pb->next = temp.next;
            }
            pb = pb->next;
        }
        pf = pf->next;

	}
	p=head->next;//由于第一个循环已经将链表移到末尾，所以这里要将链表移到首结点开始打印
    for(i=0;i<n;i++)
    {
        printf("%d ",p->value);
        p=p->next;
    }
    return;
}
void lab04(){
	int a1=3,a2=5,a3=8,a5;
	char a4;
	int flag=0;//表示player1 
	while(true){
		if(a1==0&&a2==0&&a3==0){
			break;
		}
		printf("Row A:");
		for(int i=0;i<a1;i++){
			printf("o");
		} 
		printf("\n");
		printf("Row B:");
		for(int i=0;i<a2;i++){
			printf("o");
		} 
		printf("\n");
		printf("Row C:");
		for(int i=0;i<a3;i++){
			printf("o");
		} 
		printf("\n");
label1:		if(flag==0){
			printf("Player 1, choose a row and number of rocks:");
		}
		if(flag==1){
			printf("Player 2, choose a row and number of rocks:");
		}
		getchar();
		scanf("%c%d",&a4,&a5);
		printf("\n"); 
	
		if(a4!='A'&&a4!='B'&&a4!='C'){
			printf("Invalid move. Try again.\n");
			goto label1;
		}
		if(a4=='A'){
			if(a5>a1){
				printf("Invalid move. Try again.\n");
				goto label1;
			}
			else{
				a1=a1-a5;
			}
		}
		if(a4=='B'){
			if(a5>a2){
				printf("Invalid move. Try again.\n");
				goto label1;
			}
			else{
				a2=a2-a5;	
			}
		}
		if(a4=='C'){
			if(a5>a3){
				printf("Invalid move. Try again.\n");
				goto label1;
			}
			else{
				a3=a3-a5;
			}
		}
		if(flag==0){
			flag=1;
		}
		else{
			flag=0;
		}
		
	}
	if(flag==0){
		printf("Player 1 Wins.");
	}
	else{
		printf("Player 2 Wins.");
	}
	return ;
}
void lab05(){
	char ch;
while(1)
{
printf("ICS2020 ");

if( kbhit() )
{
ch = getch();
if( ch=='0'||ch=='1'||ch=='2'||ch=='3'||ch=='4'||ch=='5'||ch=='6'||ch=='7'||ch=='8'||ch=='9' ){
	printf("%c is a decimal digit",ch);
}
else{
	printf("%c is not a decimal digit",ch);
}
}
Sleep(500);
}
printf("End!\n");
system("pause");
return ;
}
int main(){
	lab02();
	lab03();
	lab04();
	lab05();
	return 0;
}
