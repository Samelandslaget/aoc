CREATE TABLE d4 (
	id int identity(0,1) primary key,
	byr int check (byr>=1920 and byr<=2002),
	ecl varchar(3) check (ecl in ('amb','blu','brn','gry','grn','hzl','oth')),
	eyr int check (eyr>=2020 and eyr<=2030),
	hcl varchar(7) check (hcl like '#[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]'),
	hgt_typ varchar(2),
	hgt_val int,
	iyr int check (iyr>=2010 and iyr<=2020),
	pid varchar(9) check (pid not like '%[^0-9]%' and len(pid)=9),
	constraint CHK_hgt check ((hgt_typ='cm' and hgt_val>=150 and hgt_val<=193) or (hgt_typ='in' and hgt_val>=59 and hgt_val<=76))
);