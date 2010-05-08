using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Runtime.Serialization;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;

namespace DBNL.App.Models
{
    [Serializable()]
    public class Counter : ISerializable 
    {
        public int OnlineUsers { get; set; }
        public long Visits { get; set; }
        public void Visit()
        {
            OnlineUsers++;
            Visits++;
            Save();
        }
        public void Leave()
        {
            OnlineUsers--;
            Save();
        }
        public void Save()
        {
            Stream stream = File.Open(HttpContext.Current.Server.MapPath("~/App_Data/counter"), FileMode.Open);
            BinaryFormatter bformatter = new BinaryFormatter();
            bformatter.Serialize(stream, this);
            stream.Close();
        }
        public static Counter Load() {
            string path = HttpContext.Current.Server.MapPath("~/App_Data/counter");
            if (!File.Exists(path))
            {
                File.Create(path).Close();
                Counter c = new Counter() { OnlineUsers = 0, Visits = 931397 };
                c.Save();
                return c;
            }
            Stream stream = File.Open(path, FileMode.OpenOrCreate);
            BinaryFormatter bformatter = new BinaryFormatter();
            Counter counter = (Counter)bformatter.Deserialize(stream);
            stream.Close();
            return counter;
        }

        public void GetObjectData(SerializationInfo info, StreamingContext context)
        {
            info.AddValue("OnlineUsers", this.OnlineUsers);
            info.AddValue("Visits", this.Visits);

        }
    }
}
