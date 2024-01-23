using DirectoryTest;

namespace Tests
{
    public class CalculatorTests
    {
        [Fact]
        public void Add_Success()
        {
            // Act
            int sum = Calculator.Add(1, 2);

            // Assert
            Assert.Equal(3, sum);
        }
    }
}