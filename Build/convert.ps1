$word = NEW-OBJECT -COMOBJECT WORD.APPLICATION

$files = Get-ChildItem | Where-Object{$_.Name -match "HolographicAcademyJP.docx"}
foreach($file in $files)
{   
    try 
   {
        Write-Host "$($file.FullName) convert start."        
        $doc = $word.Documents.OpenNoRepairDialog($file.FullName)
        $doc.SaveAs([ref] $file.FullName.Replace(".docx",".pdf"),[ref] 17)
        $doc.Close()
        Write-Host "$($file.FullName) convert success."        
    }
    catch
    {
        Write-Host "[ERROR]$($file.FullName) convert failed."
    }
}
$word.Quit()
