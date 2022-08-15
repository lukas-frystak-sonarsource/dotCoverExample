using NUnit.Framework;
using MathLibrary;

namespace MathLibraryTests
{
    public class DataProcessorTests
    {
        [SetUp]
        public void Setup()
        {
            // Nothing here yet.
        }

        [Test]
        public void ConstructorTest()
        {
            Assert.DoesNotThrow(() => new DataProcessor());
        }
    }
}