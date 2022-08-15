using System;

namespace MathLibrary
{
    public class DataProcessor
    {
        private readonly string _instance = string.Empty;

        public DataProcessor()
        {
            // There's nothing here
        }

        public string Instance
        {
            get
            {
                return _instance;
            }
        }
    }
}
