(defun c:FLANS()
  (graphscr)
;;aci tanimlamasi: sifir=0 doksan=90 yuzseksen=180 z4=270
  (setq sifir 0
        z5 (/ pi 4)
        doksan (/ pi 2)
        z6 (/(* 3 pi)4)
        yuzseksen pi
        z7 (/(* 5 pi)4)
        z4 (/(* 3 pi)2)
        z8 (/(* 7 pi)4)) 
(setvar "osmode" 0 )

	
	  (startapp "notepad" "C:/Users/onursit/Desktop/PDF/toplama_yol.dat")
  	(alert "kopyalama ve kaydetme bittiyse ok tiklayiniz.")
  	(setq yol (open (strcat "C:/Users/onursit/Desktop/PDF/toplama_yol.dat") "r"))
	 (setq oku1 (read-line yol))
 	; (setq oku2 (vl-directory-files oku1 "*.dxf"))
(princ oku1)  

(repeat 999



(command "-COLOR" "7")
  (setq orjin  (getpoint "\n Yerlesim noktasini seciniz:"))
  (setq kod (getstring "\n KOD Gir: "))
  (setq a   (getreal  "\n A Gir: "))
  (setq b   (getreal  "\n B Gir: "))
  (setq c   (getreal  "\n C Gir: "))
  (setq d   (getreal  "\n D Gir: "))
  (setq s   (getreal  "\n S Gir: "))
  (setq k   (getreal  "\n K Gir: "))
	
  (setq rb (/ b 2))
  (setq ic (polar orjin sifir c))
  (setq ar (polar orjin sifir rb)) 
  
  
  (command "circle" orjin "d" c "")
  (command "circle" orjin "d" a "")

  (command "-COLOR" "5")  
  (command "circle" ar "d" d "")
  (setq cap (ssget "x" (list (cons 62 5 ))))
  (command "array" cap "" "PO" orjin  s "360" "Y")
  (setq cap (ssget "x" (list (cons 62 5 ))))
  (COMMAND "CHANGE" cap "" "P" "color" 7 "")
 (command "zoom" "e")
 (setq bs01 (strcat oku1 "/" "DN" kod ".dxf"))
 (princ bs01)
 ;(COMMAND "-WBLOCK" bs01 "" "" bs03 bs05 "" "" "undo" "")
 (command "_saveas" "" "" bs01)
;(setq sset (ssget "w" bs03 bs04 (list (cons 0 "DIMENSION" ))))
(setq sset (ssget "x"(list (cons 0 "CIRCLE" ))))
(command "erase" sset "")
;(command "close" "y")
 (setvar "osmode" 183 ) 
)
)