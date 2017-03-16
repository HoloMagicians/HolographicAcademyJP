rem rmdir output /s /q

mkdir output




xcopy "Contents\*.md" "output" /e /y




cd output 


"C:\Program Files (x86)\Pandoc\pandoc" --reference-docx=..\Build\reference.docx -o HolographicAcademyJP.docx holograms_100.md holograms_101.md holograms_101e.md holograms_210.md holograms_211.md holograms_212.md holograms_220.md holograms_230.md holograms_240.md 




move HolographicAcademyJP.docx ..\HolographicAcademyJP.docx




cd ..\


powershell .\Build\convert.ps1




rmdir /S /Q output




move /Y "HolographicAcademyJP.pdf" %HOMEPATH%\Dropbox\Books\HolographicAcademyJP


move /Y "HolographicAcademyJP.docx" %HOMEPATH%\Dropbox\Books\HolographicAcademyJP


pause
