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
        private object locker = new object();
        public long Visits { get; set; }

         protected Counter(SerializationInfo info, StreamingContext context) {
             this.OnlineUsers = info.GetInt32("OnlineUsers");
             this.Visits = info.GetInt64("Visits");
            }

         protected Counter()
         {
             this.OnlineUsers = 0;
             this.Visits = 0;
         }
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
        private void Save()
        {
            lock (locker)
            {
                Stream stream = File.Open(HttpContext.Current.Server.MapPath("~/App_Data/counter"), FileMode.Open);
                BinaryFormatter bformatter = new BinaryFormatter();
                bformatter.Serialize(stream, this);
                stream.Close();
            }
        }
        public static Counter Load() {
            string path = HttpContext.Current.Server.MapPath("~/App_Data/counter");
            if (!File.Exists(path))
            {
                File.Create(path).Close();
                Counter c = new Counter() { OnlineUsers = 0, Visits = 1477637};
                c.Save();
                return c;
            }
            Stream stream = File.Open(path, FileMode.OpenOrCreate, FileAccess.ReadWrite, FileShare.ReadWrite);
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

        public void Reset()
        {
            this.OnlineUsers = 0;
            Save();
        }
    }
}
