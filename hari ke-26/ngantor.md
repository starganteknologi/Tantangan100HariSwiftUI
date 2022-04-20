# aplikasi ngantor

membuat aplikasi estimasi jam berapa ngantor

jam berapa sebaiknya berangkat kantor dari A ke Z dengan angkutan TJ klo mau jam 9 udah sampe

## Siapin data

https://trumpexcel.com/generate-random-numbers-excel/

- asumsi kerja mulai jam 8
- dari jarak terjauh orang mulai berangkat jam 4
- paling telat orang berangkat kerja jam 7.45 agar tidak telat


dimulai dari jam 4  dihitung dengan detik

sehingga dengan asumsi orang brkt dari jam 4 - 7.45 saking deketnya

ada yang hanya butuh 15 menit doank

maka
- jam berangkat angka range nya adalah 0 hingga 4( 4 * 60 * 60 )
- jam sampai rangenya bisa dari menit ke 15 (15 * 60 ) sampe 4 jam 30 menit ( 4 * 60 * 60 ) + ( 30 * 60 )
