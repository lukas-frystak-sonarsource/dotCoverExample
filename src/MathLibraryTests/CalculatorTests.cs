using NUnit.Framework;
using MathLibrary;

namespace MathLibraryTests
{
    public class CalculatorTests
    {
        [SetUp]
        public void Setup()
        {
            // Nothing here yet.
        }

        [Test]
        public void CalculatorAdd()
        {
            // Expected
            int expected = 3;

            // Actual
            int actual = Calculator.Add(1, 2);

            // Assert
            Assert.AreEqual(expected, actual);
        }

        [TestCase(5, 2, 3)]
        [TestCase(10, 2, 8)]
        public void CalculatorSubtract(int a, int b, int expected)
        {
            // Expected

            // Actual
            int actual = Calculator.Subtract(a, b);

            // Assert
            Assert.AreEqual(expected, actual);
        }

        [TestCase(10, 2, 5)]
        public void CalculatorDivide(double a, double b, double expected)
        {
            // Expected

            // Actual
            double actual = Calculator.Divide(a, b);

            // Assert
            Assert.AreEqual(expected, actual);
        }
    }
}