using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xunit;
using Tower;

namespace Xtests
{
    public class MyTests
    {
        [Fact]
        static void TestOrder()
        {
            var testArray = Tower.Program.OrderPieces(5);
            // Todo: find way to test whole array
            Assert.Equal(testArray[0], 5);
        }

        [Fact]
        public void ValidMove()
        {
            var result = Tower.Program.ValidEvenOrOdd(1, 2);
            Assert.Equal(result, true);
        }

        [Fact]
        public void InValidMove()
        {
            var result = Tower.Program.ValidEvenOrOdd(2, 2);
            Assert.Equal(result, false);
        }

        [Fact]
        public void MovePiece0To1()
        {
            Tower.Program.Rod0 = new int[] { 4, 2, 3 };
            Tower.Program.Rod1 = new int[] { 5, 6, 2 };
            var move = Tower.Program.MovePiece(0, 1, "");
            Assert.Equal(Tower.Program.Rod0.Last(), 2);
            Assert.Equal(Tower.Program.Rod1.Last(), 3);
            //Console.WriteLine(Tower.Program.Rod0.ToString());


        }
    }

}
    
