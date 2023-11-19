using Praktika.Components;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;

namespace Praktika
{
    /// <summary>
    /// Логика взаимодействия для App.xaml
    /// </summary>
    public partial class App : Application
    {
        public static UP321WPFEntities1 db = new UP321WPFEntities1();
        public static string Role = "";
        public static int User = 0;
    }
}
