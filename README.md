Petunjuk Penggunaan aplikasi web CDMAArena
1. Anda diharapkan tidak merubah penempatan folder/file yang berada di dalam folder CDMAArena agar 
   aplikasi bekerja dengan baik.

2. Anda dipersilahkan menaruh folder CDMAArena dimana saja sesuai keinginan di dalam penyimpanan PC anda

3. Terlebih dahulu membuka file index.js di dalam folder CDMAArena dengan menggunakan text editor untuk 
   merubah parameter konfigurasi postgreSQL pada line 8-14 sesuai konfigurasi anda.

4. Lalu, membuat database pada postgreSQL dengan nama CDMAArena
   CREATE DATABASE cdmaarena;

5. Melakukan import database dengan menggunakan command prompt, terlebih dahulu memasuki direktori folder
   postgreSQL disimpan dengan command berikut
   cd C:\Program Files\PostgreSQL\13\bin
   setelah itu, memasuki command untuk meakukan import database sebagai berikut
   psql -U username -d cdmaarena < ...\CDMAArena\cdmaarenadatabase.sql

6. Setelah itu, memasuki direktori penyimpanan dari folder CDMAArena dengan command prompt
   cd ...\CDMAArena
   dan menjalankan aplikasi index.js dengan command
   node index.js

7. Setelah aplikasi index.js berjalan, memasuki browser dengan mengetik url 
   localhost:61666

8. Aplikasi web akan berjalan dengan menampilkan tampilan home terlebih dahulu

9. Pada aplikasi web ini, anda dapat menambah, melihat, merubah, dan menghapus data-data tentang smartphone

10. Untuk memulai, anda diharapkan menambahkan data baru terlebih dahulu dengan mengisi semua form yang 
    telah disediakan. Jika sudah, anda dapat melihat data yang telah anda masukkan pada navigasi
    smartphones dan bagian detail smartphone dengan meng-hover kursor ke gambar smartphone

11. Untuk merubah data, anda diharapkan memasukkan gambar kembali agar perubahan data bekerja dengan baik
