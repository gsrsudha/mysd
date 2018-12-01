using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MYSD.Startup))]
namespace MYSD
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
