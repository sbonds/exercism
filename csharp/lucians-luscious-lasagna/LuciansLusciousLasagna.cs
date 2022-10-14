class Lasagna
{
    // How do I define methods?
    // https://learn.microsoft.com/en-us/dotnet/csharp/programming-guide/classes-and-structs/methods

    private readonly int bakingTime = 40;
    private readonly int prepTimePerLayer = 2;

    // TODO: define the 'ExpectedMinutesInOven()' method
    public int ExpectedMinutesInOven()
    {
        return bakingTime;
    }

    // TODO: define the 'RemainingMinutesInOven()' method
    public int RemainingMinutesInOven(int timeInOvenSoFar)
    {
        return bakingTime - timeInOvenSoFar;
    }

    // TODO: define the 'PreparationTimeInMinutes()' method
    public int PreparationTimeInMinutes(int layersDesired)
    {
        return layersDesired * prepTimePerLayer;
    }

    // TODO: define the 'ElapsedTimeInMinutes()' method
    public int ElapsedTimeInMinutes(int layersDesired, int timeInOvenSoFar) {
        return PreparationTimeInMinutes(layersDesired) + timeInOvenSoFar;
    }

    // Test via cd to this directory and run:
    //   dotnet test
    // Submit via:
    //   exercism submit LuciansLusciousLasagna.cs
}
