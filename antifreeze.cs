using System;
using System.Diagnostics;
using System.Windows.Forms;
using System.Threading;

/*
Miranda Studios (DUDEX64) Freeze No More
Copyright (C) 2019 Michael Miranda, all rights reserved.
*/

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
					try 
					{
						if (app.ProcessName == "explorer")
						{
							if(GetExplorers() == 1)
								continue;
						}
						app.Kill();
						MessageBox.Show("Antifreeze killed " + app.ProcessName + " because it was not responding", "Freeze No More");
					} 
					catch (Exception e0) 
					{
						MessageBox.Show("An error occurred while Antifreeze tried to kill " + app.ProcessName + ".\n" + e0.ToString());
					}
				}
				else
				{
					Thread.Sleep(100);
				}
			}
			Thread.Sleep(8000);
		}
    }
	static int GetExplorers()
	{
		return Process.GetProcessesByName("explorer").Length;
	}
}
