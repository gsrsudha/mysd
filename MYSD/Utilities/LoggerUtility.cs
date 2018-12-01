using log4net;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MYSD.Utilities
{
    public class LoggerUtility
    {
        public static ILog Logger;

        internal static void InitializeLogger()
        {
            if (LogManager.GetCurrentLoggers().Length == 0)
            {
                log4net.Config.BasicConfigurator.Configure();
            }
            Logger = LogManager.GetLogger("MYSDLogger");
            Logger.Info("Make your special day System - Application started.");
        }
    }
}