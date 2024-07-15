// MyEditBoxes
//---------------------------------------------------------------------------------------------------------
Robot_Params : dialog {
 key = "Title";
 label = "Robot Parameters";
 initial_focus = "Edit1";
 
 spacer;

// Starting Point
 
 : row {
 label = "Starting point";
 : boxed_column {
   fixed_width = true;
   : column {
     width = 15;
     fixed_width = true;
     spacer;
     : text {
       key = "Text9";
       label = "X";
     }
   }
 : edit_box {
   key = "Edit9";//Edit9$ from lsp file
   edit_width = 5;
   fixed_width = true;
   }
 }
 
 : boxed_column {
   fixed_width = true;
   : column {
     width = 15;
     fixed_width = true;
     spacer;
     : text {
       key = "Text10";
       label = "Y";
       }
     }
 : edit_box {
   key = "Edit10";//Edit10$ from lsp file
   edit_width = 5;
   fixed_width = true;
   }
 }
}
 
 // ARM 1 BOX

 
 : boxed_column {
 label = "Arm1";
 : row {
   fixed_width = true;
   : column {
     width = 30;
     fixed_width = true;
     spacer;
     : text {
       key = "Text1";
       label = "Length";
     }
   }
 : edit_box {
   key = "Edit1";//Edit1$ from lsp file
   edit_width = 15;
   fixed_width = true;
   }
 }
 
 : row {
   fixed_width = true;
   : column {
     width = 30;
     fixed_width = true;
     spacer;
     : text {
       key = "Text2";
       label = "Angle";
       }
     }
 : edit_box {
   key = "Edit2";//Edit2$ from lsp file
   edit_width = 15;
   fixed_width = true;
   }
 }

 spacer;
 
 : row {
   fixed_width = true;
   : column {
     width = 30;
     fixed_width = true;
     spacer;
     : text {
       key = "Text3";
       label = "Forward Angle";
       }
     }
 : edit_box {
   key = "Edit3";//Edit3$ from lsp file
   edit_width = 15;
   fixed_width = true;
   }
 }
 
: row {
   fixed_width = true;
   : column {
     width = 30;
     fixed_width = true;
     spacer;
     : text {
       key = "Text4";
       label = "Backward Angle";
       }
     }
 : edit_box {
   key = "Edit4";//Edit4$ from lsp file
   edit_width = 15;
   fixed_width = true;
   }
 }
 
 spacer;
 }
 
 spacer;
 // ARM 2 BOX
 : boxed_column {
 label = "Arm2";
 : row {
   fixed_width = true;
   : column {
     width = 30;
     fixed_width = true;
     spacer;
     : text {
       key = "Text5";
       label = "Length";
     }
   }
 : edit_box {
   key = "Edit5";//Edit5$ from lsp file
   edit_width = 15;
   fixed_width = true;
   }
 }
 
 : row {
   fixed_width = true;
   : column {
     width = 30;
     fixed_width = true;
     spacer;
     : text {
       key = "Text6";
       label = "Angle";
       }
     }
 : edit_box {
   key = "Edit6";//Edit6$ from lsp file
   edit_width = 15;
   fixed_width = true;
   }
 }

 spacer;
 
 : row {
   fixed_width = true;
   : column {
     width = 30;
     fixed_width = true;
     spacer;
     : text {
       key = "Text7";
       label = "Forward Angle";
       }
     }
 : edit_box {
   key = "Edit7";//Edit7$ from lsp file
   edit_width = 15;
   fixed_width = true;
   }
 }
 
: row {
   fixed_width = true;
   : column {
     width = 30;
     fixed_width = true;
     spacer;
     : text {
       key = "Text8";
       label = "Backward Angle";
       }
     }
 : edit_box {
   key = "Edit8";//Edit8$ from lsp file
   edit_width = 15;
   fixed_width = true;
   }
 }
 spacer;
 }

 
 ok_only;
}