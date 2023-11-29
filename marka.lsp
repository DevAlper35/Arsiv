(defun C:mm ()


(setvar "osmode" 0 )





;;;;; Dxf / Dwg ismini SARI renkte ekrana yazdrma

(setq ck1 (getvar "dwgname"))
(setq ck2 (strlen ck1))
(setq ck3 (- ck2 4))

(setq altc ck1)
(setq bul_poz1 (ASCII "_"))
(setq alper_poz1(VL-STRING-POSITION bul_poz1 altc)) 
;(setq alper_poz1( alper_poz1 2))

(setq ck4 (substr ck1 1 alper_poz1))

(command "ZOOM" "E")
(setq ck6 10) ; TEXT BOYUTUNU BURDAN AYARLA
;(setq ck6 (getdist (strcat "
;Yazi Yuksekligini Giriniz : ")))

(command "-COLOR" "2"); RENK INDEX

(setq ck4 (substr ck1 1 ck3))
(setq ck5 (getpoint "\n Koduun yazilmasini istediginiz noktaya tiklayiniz. "))

(command "text" ck5 ck6 "0" ck4)



;(command "close" "n")	;  kapat
)