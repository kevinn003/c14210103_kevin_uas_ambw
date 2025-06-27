# c14210103_kevin_uas_ambw

UAS AMBW
Nama : Kevin Alexander
NRP : C14210103

Judul : Simple Recipe Keeper App

Penjelasan fitur : 
1. Fitur Login : Jika user telah memiliki account, user dapat memasukan email dan password untuk login. Jika user lupa password, user dapat klik "Forgot password" dan akan dikirim link untuk reset password pada email (dengan catatan user harus menggunakan email asli agar link reset password dapat dibuka di email.)
2. Fitur sign up : Jika user belum memiliki account, user dapat register dengan memasukan nama, email, password dan confirm password. 
3. Recipe list page : halaman ini merupakan home page sekaligus berisi daftar resep yang dibuat oleh user. User dapat add resep dengan klik button "+". User dapat klik resep yang ada untuk melihat detail resep.
3. Fitur add recipe : Fitur untuk user dapat menambahkan resep. User memasukan nama resep, deskripsi, dan bahan. Resep yang berhasil di add ditampilkan di halaman recipe list page.
4. Fitur edit recipe : Pada halaman recipe list page, user dapat klik button "pensil" untuk edit resep.
5. Fitur delete recipe : Pada halaman recipe list page, user dapat klik button "sampah" untuk delete resep.
6. Proile page : User dapat melihat profil yang berisi profile picture, nama, dan email. User dapat klik button "sign out" untuk sign out.

Langkah install dan build : 
1. Pastikan ndkVersion = "29.0.13599879" 
2. Pastikan minSdk = 23
3. Pada terminal, lakukan flutter clean, kemudian flutter pub get, kemudia flutter run

Teknologi yang digunakan : 
1. Firestore Firebase untuk database
- Database terdiri dari : 
    - users : terdiri dari field email, nama, uid, createdAt
    - recipes : terdiri dari field name, ingredients, description, createdAt, uid
2. Shared preferences untuk menyimpan session informasi login user

dummy user : test@gmail.com
dummy password : 12345678

