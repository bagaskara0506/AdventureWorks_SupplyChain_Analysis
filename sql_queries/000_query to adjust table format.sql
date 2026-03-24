-- Meyesuiakan table aw_calendar agar kolom format date saat query import menerima dalam format "DMY" tetapi menghasilkan output ISO "YYYY-MM-DD"
-- ALTER DATABASE adventureworks_supplychain SET datestyle TO 'ISO, MDY';

-- Merubah table aw_customer pada kolom annual_income dari format NUMERIC ke VARCHAR(50) agar dapat membaca simbol $
-- ALTER TABLE aw_customers ALTER COLUMN annual_income TYPE VARCHAR(50);

-- Setelah merubah format table aw_customer pada kolom annual_income, Lanjut import data csv
-- Note Berhubung pada kolom email ada data yang berisi é maka saat import perlu dirubah encoding ke WIN1252 atau LATIN1
-- Lalu proses Menghapus simbol $, tanda koma, dan spasi
-- UPDATE aw_customers
-- SET annual_income = REPLACE(REPLACE(annual_income, '$',''),',','');
-- Mengembalikan tipe datanya dari pengubahan sebelumnya ke VARCHAR menjadi angka (NUMERIC) yang bersih
-- ALTER TABLE aw_customers ALTER COLUMN annual_income TYPE NUMERIC USING annual_income::NUMERIC;