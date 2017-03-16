rem rmdir output /s /q



mkdir output




xcopy "Chapter 1" "output" /e /y




cd output 


"C:\Program Files (x86)\Pandoc\pandoc" --reference-docx=..\reference.docx -o HolographicAcademyJP.docx Contents\holograms_100.md 




move HolographicAcademyJP.docx ..\HolographicAcademyJP.docx




cd ..\


powershell .\convert.ps1




rmdir /S /Q output




move /Y "HolographicAcademyJP.pdf" %HOMEPATH%\Dropbox\Books\HolographicAcademyJP


move /Y "HolographicAcademyJP.docx" %HOMEPATH%\Dropbox\Books\HolographicAcademyJP


pause
