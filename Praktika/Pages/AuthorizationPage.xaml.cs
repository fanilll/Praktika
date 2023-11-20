﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Praktika.Pages
{
    /// <summary>
    /// Логика взаимодействия для AuthorizationPage.xaml
    /// </summary>
    public partial class AuthorizationPage : Page
    {
        public AuthorizationPage()
        {
            InitializeComponent();
            App.Role = "";
            App.User = 0;
        }

        private void EntryButt_Click(object sender, RoutedEventArgs e)
        {
            var studentList = App.db.Student.ToList();
            var teacherList = App.db.Employee.ToList();
            if (LoginTb.Text == "student" && PasswordTb.Password != "")
            {
                var list = studentList.Where(x => x.Id_Student == int.Parse(PasswordTb.Password)).ToList();
                if (list.Count() == 0)
                { MessageBox.Show("Неправильный логин или пароль"); return; }
                if (list.First().Id_Student == int.Parse(PasswordTb.Password))
                {
                    App.Role = "st";
                    App.User = int.Parse(PasswordTb.Password);
                    NavigationService.Navigate(new NavigationPage());
                }
            }
            else if (LoginTb.Text == "teacher" && PasswordTb.Password != "")
            {
                var list = teacherList.Where(x => x.Id_Employee == int.Parse(PasswordTb.Password)).ToList();
                if (list.Count() == 0)
                { MessageBox.Show("Неправильный логин или пароль"); return; }
                if (list.First().Id_Employee == int.Parse(PasswordTb.Password))
                {
                    App.Role = "tch";
                    App.User = int.Parse(PasswordTb.Password);
                    NavigationService.Navigate(new NavigationPage());
                }
            }
            else if (LoginTb.Text == "admin" && PasswordTb.Password != "")
            {
                var list = teacherList.Where(x => x.Chief == x.Id_Employee && x.Id_Employee == int.Parse(PasswordTb.Password)).ToList();
                if (list.Count() == 0)
                { MessageBox.Show("Неправильный логин или пароль"); return; }
                if (list.First().Id_Employee == int.Parse(PasswordTb.Password))
                {
                    App.Role = "adm";
                    App.User = int.Parse(PasswordTb.Password);
                    NavigationService.Navigate(new NavigationPage());
                }
            }
            else MessageBox.Show("Неправильный логин или пароль");
        }

        private void HomeButt_Click(object sender, RoutedEventArgs e)
        {
            App.Role = "гость";
            NavigationService.Navigate(new NavigationPage());
        }
    }
}
