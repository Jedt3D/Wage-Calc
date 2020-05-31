XIncludeFile "wageCalculator.pbf"

Procedure setUpDefault(event,Window_0)
  SetGadgetText(String_3, "7")
EndProcedure


Procedure calculateEvent(EventType.i)
  hourly$ = GetGadgetText(String_1)
  hourWorked$ = GetGadgetText(String_2)
  taxRate$ = GetGadgetText(String_3)
  ; string values are extracted from form
  
  ; now we convert them to doubles or .d values for currency purposes
  hourly.d = ValD(hourly$)
  hourWorked.d = ValD(hourWorked$)
  taxRate.d = ValD(taxRate$)
  
  ; now we do some calculations for the before & after tax amounts
  beforeTax.d = hourly*hourWorked
  afterTax.d = beforeTax-((beforeTax*taxRate)/100)
  
  ; now we send the totals above back To the form
  SetGadgetText(String_4, StrD(beforeTax,2)) ; the ,2 is for 2 decimal places
  SetGadgetText(String_5, StrD(afterTax,2))
EndProcedure

OpenWindow_0() ; now we open the main window, check the source code for name

    
Repeat
  event = WaitWindowEvent()
Until Window_0_Events(event) = #False

; IDE Options = PureBasic 5.72 (MacOS X - x64)
; CursorPosition = 28
; FirstLine = 3
; Folding = -
; EnableXP