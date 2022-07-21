using System;

namespace UnitsLibrary
{
    public static class UnitConversions
    {
        public static double MetersToInches(double inputMeters)
        {
            return inputMeters * 39.3701;
        }

        public static double InchesToMeters(double inputInches)
        {
            return inputInches * 0.0254;
        }
    }
}
