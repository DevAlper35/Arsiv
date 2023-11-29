(defun c:3	()
  (setq	selg1 (ssget "x"
		     '((0 . "circle"))
	      )
  )
  (setq c 0)

  (if (= selg1 nil)

    (setq sx3 0)
  )

  (if (/= selg1 nil)

    (setq sx3 (sslength selg1))

  )


  (setq sklist-x2 (list))
  (setq sklist-y2 (list))

  (repeat sx3

    (Setq sk01 (ssname selg1 c))


    (vl-load-com)
    (setq arc (cdr (assoc 10 (entget sk01)))) ; daire merkezi
    (setq arc1 (cdr (assoc 40 (entget sk01)))) ; daire yarý çapý


    (setq sk03x (- (car arc) arc1))	; dairenin baslama noktasý x
    (setq sk03x1 (+ (car arc) arc1))	; dairenin bitis noktasý x

    (setq sk03y (+ (cadr arc) arc1))	; dairenin baslama noktasý y
    (setq sk03y1 (- (cadr arc) arc1))	; dairenin baslama noktasý y

    (setq sklistx (list sk03x sk03x1))	; x ler liste haline getiriliyor
    (setq sklisty (list sk03y sk03y1))	; yler liste halinme getiriliyor

    (setq sklist-x2 (append sklistx sklist-x2))
    (setq sklist-y2 (append sklisty sklist-y2))

    (setq c (+ c 1))



  )
;;;;;;;;;;;;;;;;;;;;;;;;arc seçme bolumu  
  (setq	selg1 (ssget "x"
		     '((0 . "arc"))
	      )
  )
  (setq c 0)

  (if (= selg1 nil)

    (setq sx3 0)
  )

  (if (/= selg1 nil)

    (setq sx3 (sslength selg1))

  )


  (setq sklist-x (list))
  (setq sklist-y (list))

  (repeat sx3

    (Setq sk01 (ssname selg1 c))


    (vl-load-com)
    (setq arc (cdr (assoc -1 (entget sk01))))
    (setq ke (vlax-curve-getPointAtDist
	       arc
	       (/ (vlax-curve-getDistAtPoint
		    arc
		    (vlax-curve-getEndPoint arc)
		  )
		  2.0
	       )
	     )
    )


    (setq sk03x (car ke))		; arc baslama noktasý x
    (setq sk03y (cadr ke))		; arc baslama noktasý y

    (setq sklistx (list sk03x))		; x ler liste haline getiriliyor
    (setq sklisty (list sk03y))		; yler liste halinme getiriliyor

    (setq sklist-x (append sklistx sklist-x))
    (setq sklist-y (append sklisty sklist-y))

    (setq c (+ c 1))



  )
;;;;;;;;;;;;;;;;;;;;;;;;;line secme bolumu
  (setq	sel1 (ssget "x"
		    '((0 . "line"))
	     )
  )

  (setq c 0)

  (if (= sel1 nil)

    (setq sx3 0)
  )

  (if (/= sel1 nil)

    (setq sx3 (sslength sel1))

  )



  (repeat sx3

    (Setq sk01 (ssname sel1 c))

    (setq sk03x (car (cdr (assoc 10 (entget sk01)))))
					; lýne baslama noktasý x
    (setq sk03y (cadr (cdr (assoc 10 (entget sk01)))))
					; lýne baslama noktasý y
    (setq sk04x (car (cdr (assoc 11 (entget sk01)))))
					; lýne baslama noktasý x
    (setq sk04y (cadr (cdr (assoc 11 (entget sk01)))))
					; lýne baslama noktasý y

    (setq sklistx (list sk03x sk04x))	; x ler liste haline getiriliyor
    (setq sklisty (list sk03y sk04y))	; yler liste halinme getiriliyor

    (setq sklist-x (append sklistx sklist-x))
    (setq sklist-y (append sklisty sklist-y))
    (setq c (+ c 1))
  )
  (setq sklist-x (append sklist-x2 sklist-x))
  (setq sklist-y (append sklist-Y2 sklist-y))



  (setq max-x (apply 'max sklist-x))	; x eksenýnýn max i
  (setq max-y (apply 'max sklist-y))	; y ekseninin max i
  (setq min-x (apply 'min sklist-x))	; x eksenýnýn min i
  (setq min-y (apply 'min sklist-y))	; y ekseninin min i

  (setq solust (list min-x max-y))
  (setq sagust (list max-x max-y))
  (setq sagalt (list max-x min-y))
  (setq solalt (list min-x min-y))
  (setq	solorta
	 (list (car solust)
	       (+ (cadr solalt) (/ (- (cadr solust) (cadr solalt)) 2))
	 )
  )
  (setq sagorta (list (car sagust) (cadr solorta)))
  (setq
    ustorta (list (+ (car solalt) (/ (- (car sagalt) (car solalt)) 2))
		  (cadr solust)
	    )
  )
  (setq altorta (list (car ustorta) (cadr SOLALT)))
  (setq	merkez
	 (list (+ (/ (- (car sagalt) (car solalt)) 2) (car solalt))
	       (+ (/ (- (cadr sagust) (cadr sagalt)) 2) (cadr solalt))
	 )
  )
  (setq capraz (distance solust sagalt))
  (setq xuzun (distance solust sagust))
  (setq yuzun (distance solust solalt))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(COMMAND "-COLOR" "1")
(COMMAND "DIMLINEAR" sagorta solorta ustorta ) ; EKLEME ALPER
(COMMAND "DIMLINEAR"  ustorta altorta solorta  ) ; EKLEME ALPER

(setq bs05 (ssget "_W" solust sagalt))

(SETQ yer (strcat (getvar "dwgprefix"))) 

  (SETVAR "osmode" 0)
  (setq da1 (getvar "dwgname"))
  (setq da2 (strlen da1))
  (setq da3 (- da2 4))
  (setq da4 (substr da1 1 da3))

(command "shell"(strcat "mkdir " (chr 34) yer "\\" "OLCULENDIRME" ))





(setq bs01 (strcat yer  "OLCULENDIRME" "/" da4 ".dxf"))
  
  (COMMAND "_SAVEAS" "DXF" "16" bs01 )

;(command "_qsave") 	;  kaydet
(command "close" "n")	;  kapat
)

(defun s::startup () 
;(alk)   ; alk altindakileri çalistirmak için bu satiri aktif yap
)
(defun alk ()

(load (strcat "C:/Users/onursit/Desktop/ISIM/DISOLC.lsp"))(c:3 ); yolu kendin tamamla


)