#include <stdio.h>
#include <stdlib.h>

int min=99999; //nilai untuk membandingkan dengan total biaya
void tukar(), permutasi(), awal();

int main(){
	int l = 0;	
	int i,j;
	int panjang;

	awal();
	
	printf("Masukkan jumlah pekerja dan pekerjaan : ");
	scanf("%d", &panjang);
	
	int a[panjang];
	for(i = 0; i < panjang; i++){
		a[i] = i;
	}
	
	printf("\n");
	
	//memasukkan biaya tiap pekerjaan
	int arr[panjang][panjang];
	for(i = 0; i < panjang; i++){
		for(j = 0; j < panjang; j++){
			printf("Masukkan biaya dari pekerja %d pekerjaan %d: ",i+1, j+1);	
			scanf("%d", &arr[i][j]);		
		}
		printf("\n");
	}

	system("pause");
	system("cls");

	//print matriks biaya
	for(i=0;i<panjang;i++){
		printf("pekerja %d  ->  ", i+1);
		for(j = 0; j < panjang; j++){
			printf("%d\t", arr[i][j]);
		}
		printf("\n");
	}
	printf("\n\n");

	int m, n;
	m = n = panjang;
	permutasi(m, n, arr, a, l, panjang);
	
	printf("\n\nBiaya minimum untuk menyelesaikan seluruh pekerjaan : %d\n\n",min);
	
}

void awal(){
	
	system("cls");
	printf("________________________________________________\n");
	printf("   __________________________________________   \n");
	printf("| |                                          | |\n");
	printf("| |        Program Assignment Problem        | |\n");
	printf("| |    dengan Algoritma Exhaustive Search    | |\n");
	printf("| |                                          | |\n");
	printf("================================================\n");
	printf("| |                                          | |\n");
	printf("| |    1. Anak Agung Indi Kusuma Putra       | |\n");
	printf("| |       2205551079                         | |\n");
	printf("| |    1. Muhammad Ibrahim                   | |\n");
	printf("| |       2205551083                         | |\n");
	printf("| |__________________________________________| |\n");
	printf("________________________________________________\n\n");
	system("pause");
	system("cls");
	

	system("cls");
	printf("________________________________________________\n");
	printf("   __________________________________________   \n");
	printf("| |                                          | |\n");
	printf("| |        Program Assignment Problem        | |\n");
	printf("| |    dengan Algoritma Exhaustive Search    | |\n");
	printf("| |__________________________________________| |\n");
	printf("________________________________________________\n\n");
}

//melakukan penukaran posisi setiap setelah
void tukar(int a[],int l,int i){
	char temp;
	temp=a[l];
	a[l]=a[i];
	a[i]=temp;
}

//untuk mencari jumlah biaya terkecil
void permutasi(int m,int n,int arr[][n],int a[],int l,int panjang){
	int i;
	int b[panjang];
	if(l==panjang){
			int j,jumlah=0;	
			for(j=0;j<panjang;j++){
					b[j]=a[j];	
			}
			int val;
			for(i=0;i<panjang;i++){
					val=b[i];
					jumlah+=arr[val][i];	
			}
			if(min >= jumlah){
				min = jumlah;
				for(j = 0; j<panjang; j++){		
					printf("pekerja %d -> ",b[j]+1);	
				}
				printf("\tbiaya : %d\n",jumlah);
			}
	}
	else{	
		for(i=l;i<panjang;i++){
			tukar(a,l,i);
			permutasi(m,n,arr,a,l+1,panjang);
			tukar(a,l,i);
		}
	}
}