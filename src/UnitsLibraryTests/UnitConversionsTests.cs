using NUnit.Framework;
using UnitsLibrary;

namespace UnitsLibraryTests
{
    public class UnitConversionsTests
    {
        [SetUp]
        public void Setup()
        {
            // Nothing here yet.
        }

        [TestCase(1, 39.3701)]
        public void UnitConversions_MetersToInches(double inputMetres, double expectedInches)
        {
            double actualInches = UnitConversions.MetersToInches(inputMetres);

            Assert.AreEqual(expectedInches, actualInches);
        }
    }
}