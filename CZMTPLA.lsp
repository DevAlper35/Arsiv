(defun c:CZMM	()

	(alert "\n Cizimlerin toplanilacagi klasor yolunu siradaki pencereye yapistirin")

	(setq yol (open (strcat "C:/Users/onursit/Desktop/ISIM/yerlesim/toplama_yol.dat") "r"))
	  (startapp "notepad" "C:/Users/onursit/Desktop/ISIM/yerlesim/toplama_yol.dat")
  	(alert "kopyalama ve kaydetme bittiyse ok tiklayiniz.")
	 (setq oku1 (read-line yol))
 	 (setq oku2 (vl-directory-files oku1 "*.dxf"))  

	 (setq say 0)

	(setq k01 "0")
	(setq k02 "0")
	(setq sn_say (length oku2))
(repeat sn_say
	(setq k1 (strcat k01"," k02 ))
	

	
 	 (setq oku3 (nth say oku2))
  	(setq say (1+ say))  

	
	
	
	(command "-insert" (strcat oku1 "/" oku3) k1  "" "" "")
	
	(setq k01 ( rtos( + 500 (READ k01 )) 2 1 ))
	
	
		)

	)
	
)