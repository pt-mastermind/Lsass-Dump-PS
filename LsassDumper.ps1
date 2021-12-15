Add-Type -TypeDefinition @"
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.InteropServices;
using System.IO;




namespace GoodMod
{


    public static class Dump
    {
        [DllImport("kernel32.dll", SetLastError = true)]
        public static extern IntPtr OpenProcess(
             uint processAccess,
             bool bInheritHandle,
             int processId
            );

        [DllImport("Dbghelp.dll")]
        public static extern bool MiniDumpWriteDump(IntPtr hProcess, uint ProcessId, IntPtr hFile, int DumpType, ref MINIDUMP_EXCEPTION_INFORMATION ExceptionParam, IntPtr UserStreamParam, IntPtr CallbackParam);

        [StructLayout(LayoutKind.Sequential, Pack = 4)]
        public struct MINIDUMP_EXCEPTION_INFORMATION
        {

            public uint ThreadId;
            public IntPtr ExceptionPointers;
            public int ClientPointers;
        }
        public static void RunMe(int procId)
        {
            string dumpFileName = "path to the dump file";
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

            

        }



    }

    
}



"@
 
 [GoodMod.Dump]::RunMe(processid)
