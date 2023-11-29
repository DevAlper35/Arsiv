
;; capý 14 olanlarý capý 30'a ceviriyor
(defun c:cap ()

  (setq sec_degis (ssget "x" (list (cons 0 "circle") (cons 40 7))))

(setq sayac 0)
  (if (/= sec_degis nil)
    (progn
(repeat (sslength sec_degis)
  
(setq sec_degis1 (entget (ssname sec_degis sayac)))
  (setq sayac (1+ sayac))
(setq ed (subst (cons 40 15.0) (assoc 40 sec_degis1) sec_degis1 ))
(entmod ed)
  )
)); if

  )