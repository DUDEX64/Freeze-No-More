using System;
using System.Diagnostics;
using System.Windows.Forms;
using System.Threading;

class antifreeze
{
    static void Main()
    {
	Process[] apps;
        while (true)
	{
		apps = Process.GetProcesses();
		foreach (Process app in apps)
		{
			if (!app.Responding)
			{
				app.Kill();
				MessageBox.Show("Antifreeze killed " + app.ProcessName + " because it was not responding", "Freeze No More");
			}
		}
		Thread.Sleep(7000);
	}
    }
}
