using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace aromamir
{
    internal class AppData : DbContext 
    { 
        public static TradeEntities db = new TradeEntities ();
        public static DbSet <User> users { get; set; }

    }
}
