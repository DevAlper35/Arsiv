(defun c:gasket()
   (graphscr)
;aci tanimlamasi: z1=0 z2=90 z3=180 z4=270
   (setq z1 0)

   (setq n1  (getpoint  "\ Yerleşim noktasını seçiniz:"))
   (setq D   (getreal   "\ Daire yarıçapı: "))
   (setq d5  (getreal   "\ Küçük daire yarıçapı: "))
   (setq K   (getreal   "\ Deliklerin merkez yarıçapı :"))
   (setq d2  (getreal   "\ Delik çapı: "))
 ;  (setq N   (getreal   "\ Delik sayısı: "))
   

   (setq n2   (polar n1 z1 D))
   (setq n3   (polar n1 z1 d5))
   (setq n4   (polar n1 z1 K))
;   (setq n5   (polar K z1 d2))

;;;;;;;;;; Çizim kısımları
   
   (command "circle" n1 n2 "")
   (command "circle" n1 n3 "")

   (command "circle" n4 d2 "")      


)



