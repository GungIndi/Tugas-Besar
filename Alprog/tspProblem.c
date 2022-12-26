#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int mutasi();
void swap();
void assign();
void jarak();
void menghitungJarak();
void jalurFinal();
void namaKelompok();

char matriks[100][100];
int kota;
char nama[26] = "abcdefghijklnopqrstuvwxyz";
char str[] = "";
int hasil[1000000];
int x = 1;
int hasilMutasi = 0;
int ascii[] = {0};
int kecil = 1;
int finalRute = 1;

struct terpendek{
    char jalur[1000];
    // int no[1000];
};
struct terpendek rute[1000];

void swap(char *x, char *y){
    char temp;
    temp = *x;
    *x = *y;
    *y = temp;
}

char permute(char *a, int l, int r, char kotaAwal){
    if (l == r  && a[0] == kotaAwal ) {
        a[kota] = a[0];
        x++;
        menghitungJarak(a);
    }
	else{
		for (int i = l; i <= r; i++){
			swap((a + l), (a + i));
			permute(a, l + 1, r, kotaAwal);
			swap((a + l), (a + i));
		}
	}
}

int main(){
    int hasilMutasi = 1, n;
    char kotaAwal;
    namaKelompok();
    printf("\t\t____________________________________________________ \n");
    printf("\t\tMasukan jumlah kota : ");
    scanf("%d",&kota);
    assign();
    n = strlen(str);
    printf("\t\t____________________________________________________ \n");
    jarak();
    hasilMutasi = mutasi(hasilMutasi);
    getchar();
    printf("\t\tMasukan kota awal : ");
    scanf("%c",&kotaAwal);
    system("cls");
    printf("\t\t____________________________________________________ \n");
    printf("\t\tList jalur :\n");
    permute(str,0,n-1,kotaAwal);
    // for( int i = 1; i <= hasilMutasi; i++){
    //     printf(" hasil %d = %d\n",i, hasil[i]);
    // }
    // printf("%d rute %c",finalRute, rute[finalRute-1].jalur[1]);
    jalurFinal();
    return 0;
}

void assign(){
    printf("\t\tList kota :\n");
    for( int i = 0; i < kota; i++){
        str[i] = nama[i];
        printf("\t\tKota %c\n",str[i]);
    }
}

void jarak(){
    for ( int i = 1; i <= kota; i++){
        for (int j = 1; j <= kota; j++){
            if(i == j) matriks[i][j] = 0;
            else if( j < i) matriks[i][j] = matriks [j][i];
            else {
                printf("\t\tMasukan jarak %c ke %c : ",nama[i-1], nama[j-1]);
                scanf("%d", &matriks[i][j]);
            }
        }
    }
}

void menghitungJarak(char *a){
    int totalSementara = 0;
    printf("\n\t\tJalur ke-%d : \n", x-1);
    for(int i = 0; i <= kota ; i++){
        ascii[i] = (int)a[i] - 96;
        if(i == kota){
            printf("%c", a[i]);
        }
        else if(i == 0){
            printf("\t\t%c > ",a[i]);
        }
        else{
            printf("%c > ", a[i]);
        }
    }
    printf("\n");
    printf("\t\tTotal jarak = ");
    for (int i = 1; i <= kota ; i++){
        if (i == kota){
            printf("%d", matriks[ascii[i-1]][ascii[i]]);
        }
        else{
            printf("%d + ", matriks[ascii[i-1]][ascii[i]]); 

        }
        totalSementara += matriks[ascii[i-1]][ascii[i]];
    }
    hasil[x-1] = totalSementara;
    printf(" = %d,\n",hasil[x-1]);
    if(kecil > hasil[x-1]){
        finalRute = 1;
        kecil = hasil[x-1];
        for(int i=0;i <= kota; i++){
            rute[finalRute].jalur[i] = str[i];
            // rute[finalRute].no[i] = x-1;
            // printf("!%c",rute[finalRute].jalur[i]);
        }
        // printf("> ni jalur ke-%d terpendek... x = %d\n",finalRute,x);
    }
    else if(kecil == hasil[x-1] || kecil == 1){
        if(kecil == hasil[x-1]) finalRute++;
        for(int i=0;i <= kota; i++){
            kecil = hasil[x-1];
            rute[finalRute].jalur[i] = str[i];
            
            // printf("!%c",rute[finalRute].jalur[i]);
        }
        // printf("= ni jalur ke-%d terpendek\n",finalRute);
    }
}

int mutasi(int hasilMutasi){
    for ( int i = kota-1; i > 0; i--){
        hasilMutasi *= i;
    }
    printf("\t\t____________________________________________________ \n");
    printf("\t\tTotal jalur yang mungkin = %d jalur\n", hasilMutasi);
    return hasilMutasi;
}

void jalurFinal(){
    printf("\t\t_______________________________________________________ \n");
    printf("\t\t____________________________________________________ \n\n");
    printf("\t\tJalur yang paling efektif ada %d jalur\n\t\tYaitu : \n",finalRute);
    for(int i = 1; i <= finalRute; i++){
        printf("\t\t%d. ",i);
        // printf("\n\t\t Jalur Ke-%d\n", rute[i].no[i-finalRute]);
        for(int j = 0; j <= kota; j++ ){
            if(j==kota) printf("%c\n",rute[i].jalur[j]);
            else printf("%c > ",rute[i].jalur[j]);
        }
    }
    printf("\t\tDengan jarak = %d\n\n",kecil);
    printf("\t\t____________________________________________________ \n");
    printf("\t\t_______________________________________________________ \n");
    system("pause");
}

void namaKelompok(){
        system("cls");
        printf("\t\t _______________________________________________________________  \n");
	    printf("\t\t   ___________________________________________________________  \n");
        printf("\t\t| |                       TSP PROBLEM                         | |\n");
        printf("\t\t| |...........................................................| |\n");
        printf("\t\t| |___________________________________________________________| |\n");
        printf("\t\t| |             1. Anak Agung Indi Kusuma Putra               | |\n");
        printf("\t\t| |                 2205551079                                | |\n");
        printf("\t\t| |             1. Muhammad Ibrahim                           | |\n");
        printf("\t\t| |                 2205551083                                | |\n");
	    printf("\t\t| |___________________________________________________________| |\n");
	    printf("\t\t_________________________________________________________________ \n\n");
        system("pause");
        system("cls");
}