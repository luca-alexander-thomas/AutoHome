using System;

using AuthoHome_Autostart.ViewModels;

using Windows.UI.Xaml.Controls;

namespace AuthoHome_Autostart.Views
{
    public sealed partial class MainPage : Page
    {
        public MainViewModel ViewModel { get; } = new MainViewModel();

        public MainPage()
        {
            InitializeComponent();
        }
    }
}
