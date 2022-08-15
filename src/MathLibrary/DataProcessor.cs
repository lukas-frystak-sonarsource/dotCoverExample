using System;

namespace MathLibrary
{
    public class DataProcessor
    {
        private readonly string _instance = string.Empty;

        public DataProcessor()
        {
            _instance = "test";
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
