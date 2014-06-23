using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xunit;
using System.Collections.Generic;

namespace Tower
{
    public static class Program
    {
        public static int[] Rod0;
        public static int[] Rod1;
        public static int[] Rod2;

        static void Main(string[] args)
        {
            string thisMove = "";
            string lastMove = "";
            int loopCount = 0;
            const int maxLoopCount = 100;
            int numberOfPieces;

            int.TryParse(args.First(), out numberOfPieces);
            var solutionArray = OrderPieces(numberOfPieces);
            Rod0 = solutionArray;
            ShowTowers(loopCount);

            // frist move
            MovePiece(0, numberOfPieces%2 != 0 ? 1 : 2, "");
            loopCount += 1;
            ShowTowers(loopCount);
            
            // loop through all moves after first
            while (Rod2 != solutionArray)
            {
                while (lastMove == "")
                {
                    var p0 = Rod0 == null ? 0 : Rod0.Last();
                    var p1 = Rod1 == null ? 0 : Rod1.Last();
                    var p2 = Rod2 == null ? 0 : Rod2.Last();
                    thisMove = "";
                    if (ValidEvenOrOdd(p0, p1) && lastMove != "move_1_0" && thisMove == "") thisMove = "move_0_1";
                    if (ValidEvenOrOdd(p0, p2) && lastMove != "move_2_0" && thisMove == "") thisMove = "move_0_2";
                    if (ValidEvenOrOdd(p1, p0) && lastMove != "move_0_1" && thisMove == "") thisMove = "move_1_0";
                    if (ValidEvenOrOdd(p1, p2) && lastMove != "move_2_1" && thisMove == "") thisMove = "move_1_2";
                    if (ValidEvenOrOdd(p2, p0) && lastMove != "move_0_2" && thisMove == "") thisMove = "move_2_0";
                    if (ValidEvenOrOdd(p2, p1) && lastMove != "move_1_2" && thisMove == "") thisMove = "move_2_1";
                    if (thisMove == "") throw new Exception("no valid moves");

                    if (thisMove == "move_0_1") lastMove = MovePiece(0, 1, thisMove);
                    if (thisMove == "move_0_2") lastMove = MovePiece(0, 2, thisMove);
                    if (thisMove == "move_1_0") lastMove = MovePiece(1, 0, thisMove);
                    if (thisMove == "move_1_2") lastMove = MovePiece(1, 2, thisMove);
                    if (thisMove == "move_2_0") lastMove = MovePiece(2, 0, thisMove);
                    if (thisMove == "move_2_1") lastMove = MovePiece(2, 1, thisMove);
                    loopCount += 1;
                    ShowTowers(loopCount);

                    if(loopCount >= maxLoopCount) throw new Exception("max loopcount reached");
                }
            }
        }


        public static int[] OrderPieces(int numberOfPieces)
        {
            var pieceArray = new int[numberOfPieces];
            for (var x = 0; x < numberOfPieces; x++)
                pieceArray[x] = numberOfPieces - x;
            return pieceArray;
        }

        public static bool ValidEvenOrOdd(int a, int b)
        {
            if (a == 0)                     return false;
            if (a % 2 == 0 && b % 2 == 0)   return false;
            if (a % 2 != 0 && b % 2 != 0)   return false;
            return true;
        }

        public static string MovePiece(int source, int destination, string thisMove)
        {
            var sourcePiece = 0;
            if (source == 0)
            {
                sourcePiece = Rod0.Last();
                var tmp = Rod0.AsEnumerable();
                Rod0 = tmp.Take(Rod0.Length - 1).ToArray(); 
            }
            if (source == 1)
            {
                sourcePiece = Rod1.Last();
                var tmp = Rod1.AsEnumerable();
                Rod1 = tmp.Take(Rod1.Length - 1).ToArray(); 
            }
            if (source == 2)
            {
                sourcePiece = Rod2.Last();
                var tmp = Rod2.AsEnumerable();
                Rod2 = tmp.Take(Rod2.Length - 1).ToArray(); 
            }
            if (destination == 0)   Rod0 = Rod0.AddItemToArray(sourcePiece);
            if (destination == 1)   Rod1 = Rod1.AddItemToArray(sourcePiece);
            if (destination == 2)   Rod2 = Rod2.AddItemToArray(sourcePiece);
            return thisMove;
        }

        public static void ShowTowers(int loopCount)
        {
            if (Rod0 == null)   Console.WriteLine("Rod0 is null");
            else                Console.WriteLine(Rod0.ToString());
            if (Rod1 == null)   Console.WriteLine("Rod1 is null");
            else                Console.WriteLine(Rod1.ToString());
            if (Rod2 == null)   Console.WriteLine("Rod2 is null");
            else                Console.WriteLine(Rod2.ToString());
            Console.WriteLine("loop " + loopCount.ToString() + "-------------");
        }
    }



    // found this online, needed to add an item to int[]
    public static class Extensions
    {
        public static T[] AddItemToArray<T>(this T[] original, T itemToAdd)
        {
            if (original == null) return null;
            var finalArray = new T[original.Length + 1];
            for (int i = 0; i < original.Length; i++)
                finalArray[i] = original[i];
            
            finalArray[finalArray.Length - 1] = itemToAdd;
            return finalArray;
        }
    }
}
