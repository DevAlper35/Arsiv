(defun c:saa (/ temp sset ssl nsset i topyay topciz basaci sonaci boy bas son alfa)

;;;;(defun c:con ()

;;;; SETQ yu
( setq yu "M")
;;(setvar "osmode" 0 )
	(SETQ dxf "l")
;(setq S (ssget "x" (list (cons 6 "continuous" ))))

;;;;(COMMAND "CHANGE" S "" "P" "LT" "ByLayer""")


;(setq S (ssget "x" (list (cons 62 3 ))))
;(COMMAND "CHANGE" S "" "P" "C" 7"")
	(setq asave "p")
(SETQ s "u")
;(SETQ S NIL)
  
;(setvar "osmode" 183)
(setq totmin "A")

  
;;;(command "_qsave")
(setq del "r")
;(command "close" "n")
;)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq lineac "e")
;(defun s::startup () 
;(alk)   ;
 ;;;; alk altındakileri çalıştırmak için bu satırı aktif yap
;)
(setq kg "d")
;;;;;(defun alk ()
	
;;;;;(load (strcat "C:/Users/alper/Desktop/PDF/conn.lsp"))(c:con); yolu kendin tamamla

;)

(setq conf (strcat "\n  2021 " totmin dxf asave lineac del " " yu s kg s del dxf s))
(princ conf)
(setq mudurlu (getreal "\n KALINLIK GIR: "))
(princ conf)
  (prompt "\n CIZGILERI SEC: ")
  (setq sset (ssget))
  (if (null sset) 
    (progn
      (princ "\nBisey secilmedi.")
      (exit)
    )
  )
  ;; Validate selection set
  (setq ssl   (sslength sset)
        nsset (ssadd))
    (princ "\n<Seçilen objeler inceleniyor...>")
  (while (> ssl 0)
    (setq temp (ssname sset (setq ssl (1- ssl))))
    (if (or
          (= (cdr (assoc 0 (entget temp))) "LINE")
          (= (cdr (assoc 0 (entget temp))) "ARC")
           (= (cdr (assoc 0 (entget temp))) "CIRCLE")
        )
      (ssadd temp nsset)
    )
  )
  (setq ssl (sslength nsset)
        sset nsset
  )
  (print ssl)
  (princ " ARC, CIRCLE ve LINE objesi bulundu.")

   (setq i 0 topyay 0 topciz 0)
   (repeat ssl
         (setq elist (entget (ssname sset i)))
         (cond 
               ((= (cdr (assoc 0 elist)) "ARC")
                      (setq   yaricap (cdr (assoc 40 elist))
                                 alfa (- (cdr (assoc 51 elist)) 
                                           (cdr (assoc 50 elist))
                                        )
                      )
                      (if (< alfa 0.0) (setq alfa (+ alfa (* 2 PI))))
                      (setq boy (* alfa yaricap)
                               topyay (+ topyay boy)
                      )
               );ARC
               ((= (cdr (assoc 0 elist)) "CIRCLE")
                      (setq yaricap (cdr (assoc 40 elist))
                                 boy (* 2 PI yaricap)
                                 topyay (+ topyay boy)
                       )
               );CIRCLE

              ((= (cdr (assoc 0 elist)) "LINE")
                     (setq bas (cdr (assoc 10 elist))
                                son (cdr (assoc 11 elist))
                                boy (distance bas son)
                                topciz (+ topciz boy)
                      )
              );LINE
         );cond
         (setq  i (1+ i))
   )
   (princ (strcat "\nYaylar = " (rtos topyay 2 2) " m. Dogrular = " (rtos topciz 2 2) " m. Toplam Uzunluk = " (rtos (+ topciz topyay) 2 2) " m"))
   (princ)

(setq ck4 (+ topciz topyay))
(princ conf)

  (setq agr1 (getpoint "\n Sol Ust Noktaya tikla"))
(setq agr2 (getcorner agr1 "\n Sag Alt Noktaya tikla"))







; 1mm
(setq mm1 (* ck4 0.007317)) ;;;;;;; SURE / SANIYE
(setq mm1 (atoi(rtos mm1))) ;;;;;;; SURE / SANIYE
(setq mm1 (itoa mm1))




; 2mm
(setq mm2 (* ck4 0.012)) ;;;;;;; SURE / SANIYE
(setq mm2 (atoi(rtos mm2))) ;;;;;;; SURE / SANIYE
(setq mm2 (itoa mm2))



; 3mm
(setq mm3 (* ck4 0.01538)) ;;;;;;; SURE / SANIYE
(setq mm3 (atoi(rtos mm3))) ;;;;;;; SURE / SANIYE
(setq mm3 (itoa mm3))




; 4mm
(setq mm4 (* ck4 0.01714)) ;;;;;;; SURE / SANIYE
(setq mm4 (atoi(rtos mm4))) ;;;;;;; SURE / SANIYE
(setq mm4 (itoa mm4))


; 5mm
(setq mm5 (* ck4 0.01764)) ;;;;;;; SURE / SANIYE
(setq mm5 (atoi(rtos mm5))) ;;;;;;; SURE / SANIYE
(setq mm5 (itoa mm5))


; 6mm
(setq mm6 (* ck4 0.02)) ;;;;;;; SURE / SANIYE
(setq mm6 (atoi(rtos mm6))) ;;;;;;; SURE / SANIYE
(setq mm6 (itoa mm6))



; 8mm
(setq mm8 (* ck4 0.025)) ;;;;;;; SURE / SANIYE
(setq mm8 (atoi(rtos mm8))) ;;;;;;; SURE / SANIYE
(setq mm8 (itoa mm8))


; 10mm
(setq mm10 (* ck4 0.03)) ;;;;;;; SURE / SANIYE
(setq mm10 (atoi(rtos mm10))) ;;;;;;; SURE / SANIYE
(setq mm10 (itoa mm10))


; 12mm
(setq mm12 (* ck4 0.0375)) ;;;;;;; SURE / SANIYE
(setq mm12 (atoi(rtos mm12))) ;;;;;;; SURE / SANIYE
(setq mm12 (itoa mm12))


; 15mm
(setq mm15 (* ck4 0.04615)) ;;;;;;; SURE / SANIYE
(setq mm15 (atoi(rtos mm15))) ;;;;;;; SURE / SANIYE
(setq mm15 (itoa mm15))


; 20mm
(setq mm20 (* ck4 0.0666666)) ;;;;;;; SURE / SANIYE
(setq mm20 (atoi(rtos mm20))) ;;;;;;; SURE / SANIYE
(setq mm20 (itoa mm20))


(if (= mudurlu 1)
	(setq alper mm1))

(if (= mudurlu 2)
	(setq alper mm2))

(if (= mudurlu 3)
	(setq alper mm3))

(if (= mudurlu 4)
	(setq alper mm4))

(if (= mudurlu 5)
	(setq alper mm5))

(if (= mudurlu 6)
	(setq alper mm6))

(if (= mudurlu 8)
	(setq alper mm8))

(if (= mudurlu 10)
	(setq alper mm10))

(if (= mudurlu 12)
	(setq alper mm12))

(if (= mudurlu 15)
	(setq alper mm15))

(if (= mudurlu 20)
	(setq alper mm20))








(setq amudurlu (strcat "Kesim Suresi: " alper " Saniye"))
(setq am 20)
;(command "text" alp am "0" amudurlu )
(setvar "osmode" 0 )


  (setq agr3 (list (car agr2) (cadr agr1)))
  (setq agr4 (list (car agr1) (cadr agr2)))
  (setq agr5 (distance agr1 agr3))
  (setq agr6 (distance agr1 agr4))
  (setq agr8 mudurlu )
  (setq agr7 (/ (* agr5 agr6 7.86 agr8) 1000))
  (princ agr7)
(setq agr7 (atoi(rtos agr7))) ;;;;;;; SURE / SANIYE
(setq agr7 (itoa agr7))
(setq alp (getpoint "\n olcunun yazilmasini istediginiz noktaya
tiklayiniz. "))
(setq mudurlu (atoi(rtos mudurlu))) ;;;;;;; SURE / SANIYE
(setq mudurlu (itoa mudurlu))
(setq amu (strcat "Kesim Suresi: " alper " Saniye - " "Malzeme Agirligi: " agr7 " Gram / " mudurlu "mmST"  ))
(command "text" alp am "0" amu )
(setvar "osmode" 183 )
(setq sse (ssget "x" (list (cons 0 "text")(cons 67 0))))
(COMMAND "CHANGE" sse "" "P" "C" 1"")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




);defun
(princ  conf)

(princ)