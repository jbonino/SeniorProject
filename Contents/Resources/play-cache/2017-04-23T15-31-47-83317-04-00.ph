|upcNum |upcNum :=100000000000.	21 timesRepeat: 		[upcNum:=upcNum +1. 			UpcStructure post:(Item defaultForm upc:upcNum asString)copy].