(setq *MyEditBoxes@ (list nil 50 0 90 -90 25 0 90 -90 0 0))

(defun check_positive (value)
    (if (and (numberp (read value)) (> (read value) 0))
        T 
        nil 
    )
)

(defun check_real (value)
    (if (numberp (read value))
        T 
        nil 
    )
)

(defun get-dialog-data ( / Dcl_Id% len1 len2 ang1 ang2 fang1 fang2 bang1 bang2 x y)
   (princ "\nRobot_Space") (princ)
  
  ; Set Default Variables
  (if (not *MyEditBoxes@)
  (setq *MyEditBoxes@ (list nil 50 0 90 -90 25 0 90 -90 0 0))
  )
  
  (setq len1 (nth 1 *MyEditBoxes@)
  ang1 (nth 2 *MyEditBoxes@)
  fang1 (nth 3 *MyEditBoxes@)
  bang1 (nth 4 *MyEditBoxes@)
  len2 (nth 5 *MyEditBoxes@)
  ang2 (nth 6 *MyEditBoxes@)
  fang2 (nth 7 *MyEditBoxes@)
  bang2 (nth 8 *MyEditBoxes@)
  x (nth 9 *MyEditBoxes@)
  y (nth 10 *MyEditBoxes@)
  )
  
  ; Load Dialog
  (setq Dcl_Id% (load_dialog "C:\\Users\\ZZ-pc\\Documents\\box.dcl"))
  (new_dialog "Robot_Params" Dcl_Id%)
  ; Set Default Values

  (set_tile "Edit1" (itoa len1))
  (set_tile "Edit2" (itoa ang1))
  (set_tile "Edit3" (itoa fang1))
  (set_tile "Edit4" (itoa bang1))
  (set_tile "Edit5" (itoa len2))
  (set_tile "Edit6" (itoa ang2))
  (set_tile "Edit7" (itoa fang2))
  (set_tile "Edit8" (itoa bang2))
  (set_tile "Edit9" (itoa x))
  (set_tile "Edit10" (itoa y))
  
  ; Dialog Actions
 (action_tile "Edit1"
   "(if (check_positive $value)
        (setq len1 (read $value))
        (progn
            (set_tile \"Edit1\" \"Invalid value\") ; Update control to indicate error
            (prompt \"Please enter a valid positive number.\")
        )
    )")
 (action_tile "Edit2"
   "(if (check_real $value)
        (setq ang1 (read $value))
        (progn
            (set_tile \"Edit2\" \"Invalid value\") ; Update control to indicate error
            (prompt \"Please enter a valid number.\")
        )
    )")
 (action_tile "Edit3"
   "(if (check_real $value)
        (setq fang1 (read $value))
        (progn
            (set_tile \"Edit3\" \"Invalid value\") ; Update control to indicate error
            (prompt \"Please enter a valid number.\")
        )
    )")
  (action_tile "Edit4"
   "(if (check_real $value)
        (setq bang1 (read $value))
        (progn
            (set_tile \"Edit4\" \"Invalid value\") ; Update control to indicate error
            (prompt \"Please enter a valid number.\")
        )
    )")
  (action_tile "Edit5"
   "(if (check_positive $value)
        (setq len2 (read $value))
        (progn
            (set_tile \"Edit5\" \"Invalid value\") ; Update control to indicate error
            (prompt \"Please enter a valid positive number.\")
        )
    )")
  (action_tile "Edit6"
   "(if (check_real $value)
        (setq ang2 (read $value))
        (progn
            (set_tile \"Edit6\" \"Invalid value\") ; Update control to indicate error
            (prompt \"Please enter a valid number.\")
        )
    )")
  (action_tile "Edit7"
   "(if (check_real $value)
        (setq fang2 (read $value))
        (progn
            (set_tile \"Edit7\" \"Invalid value\") ; Update control to indicate error
            (prompt \"Please enter a valid number.\")
        )
    )")
  (action_tile "Edit8"
   "(if (check_real $value)
        (setq bang2 (read $value))
        (progn
            (set_tile \"Edit8\" \"Invalid value\") ; Update control to indicate error
            (prompt \"Please enter a valid number.\")
        )
    )")
  (action_tile "Edit9"
   "(if (check_real $value)
        (setq x (read $value))
        (progn
            (set_tile \"Edit9\" \"Invalid value\") ; Update control to indicate error
            (prompt \"Please enter a valid number.\")
        )
    )")
  (action_tile "Edit10"
   "(if (check_real $value)
        (setq y (read $value))
        (progn
            (set_tile \"Edit10\" \"Invalid value\") ; Update control to indicate error
            (prompt \"Please enter a valid number.\")
        )
    )")

   (setq Return# (start_dialog))
 ; Unload Dialog
 (unload_dialog Dcl_Id%)

  (if (not (and (>= ang1 bang1) (<= ang1 fang1)))
      (progn
        (prompt "\nRotation angle for joint-1 is not within acceptable limits.")
        (exit)
      )
  )
  
  (if (not (and (>= ang2 bang2) (<= ang2 fang2)))
      (progn
        (prompt "\nRotation angle for joint-2 is not within acceptable limits.")
        (exit)
      )
  )
  
 (list len1 ang1 fang1 bang1 len2 ang2 fang2 bang2 x y)
)

(defun get-rad (deg)
(* deg (/ Pi 180.0))
  )

(defun layer (Nme Col LWgt)
 (entmake (list (cons 0 "LAYER")
                (cons 100 "AcDbSymbolTableRecord")
                (cons 100 "AcDbLayerTableRecord")
                (cons 2  Nme)
                (cons 70 0)
	        (cons 62 Col)
                (cons 6 "Continuous")
                (cons 290 1)
                (cons 370 LWgt))))

(defun project ()
  (setq robot-data (get-dialog-data))
  
  (setq len1 (nth 0 robot-data)
  ang1 (nth 1 robot-data)
  fang1 (nth 2 robot-data)
  bang1 (nth 3 robot-data)
  len2 (nth 4 robot-data)
  ang2 (nth 5 robot-data)
  fang2 (nth 6 robot-data)
  bang2 (nth 7 robot-data)
  x (nth 8 robot-data)
  y (nth 9 robot-data)
  )
  
  (setq start-point (list x y))

  ;Calculation for arm tip
  (setq arm-tip (polar (polar start-point (get-rad ang1) len1) (get-rad ang2) len2))
  
  ; Draw robot
  ; Layer Robot
  (layer "Robot" 1 30)
  (setvar 'CLAYER "Robot")

  (setq joint-radius 1)
  
  (setq base-len (max (* 2 joint-radius) (/ len1 50)))
  
  (setq joint-1-point (polar start-point (get-rad ang1) len1))
  (setq joint-2-point (polar joint-1-point (get-rad (+ ang1 ang2)) len2))
  
  (setq arm-1-start-point (polar start-point (get-rad ang1) joint-radius))
  (setq arm-1-end-point (polar start-point (get-rad ang1) (- len1 joint-radius)))
  
  (setq arm-2-start-point (polar joint-1-point (get-rad (+ ang1 ang2)) joint-radius))
  (setq arm-2-end-point (polar joint-1-point (get-rad (+ ang1 ang2)) (- len2 joint-radius)))

  (setq square-pt1 (list (+ x base-len) (+ y base-len)))
  (setq square-pt2 (list (- x base-len) (- y base-len)))
  
  (command "Rectangle" square-pt1 square-pt2)
  (command "Circle" start-point joint-radius)
  (command "Circle" joint-1-point joint-radius)
  (command "Circle" joint-2-point joint-radius)
   
  (command "Line" arm-1-start-point arm-1-end-point "")
  (command "Line" arm-2-start-point arm-2-end-point "")

  ; Draw workign area

  (layer "WorkingSpace" 5 10)
  (setvar 'CLAYER "WorkingSpace")
  
  (setq arm1-ang bang1)
  (setq arm2-ang bang2)
  (setq point-radius 1)
  
  (setq arm1-iterations (fix (+ 1 (/ (- fang1 bang1) 10))))
  (setq arm2-iterations (fix (+ 1 (/ (- fang2 bang2) 10))))
  
  (setq arm1-step (/ (- fang1 bang1) (max 1 (- arm1-iterations 1.0))))
  (setq arm2-step (/ (- fang2 bang2) (max 1 (- arm2-iterations 1.0))))
  (repeat arm1-iterations
    (repeat arm2-iterations
        (setq point (polar (polar start-point (get-rad arm1-ang) len1) (get-rad (+ arm1-ang arm2-ang)) len2))
	(command "Circle" point joint-radius)
	(setq arm2-ang (+ arm2-ang arm2-step))
    )
    (setq arm2-ang bang2)
    (setq arm1-ang (+ arm1-ang arm1-step))
  )

  (princ)
)