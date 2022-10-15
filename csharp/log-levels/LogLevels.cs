using System;
using System.Text.RegularExpressions;

static class LogLine
{
    // Now you have two problems.
    static string messageSplitRegex = @"^\[(INFO|WARNING|ERROR)\]:\s+(.*)$";

    public static string Message(string logLine)
    {
        // https://learn.microsoft.com/en-us/dotnet/api/system.text.regularexpressions.matchcollection?view=net-6.0
        return Regex.Match(logLine,messageSplitRegex).Groups[2].Value.Trim();
    }

    public static string LogLevel(string logLine)
    {
        return Regex.Match(logLine,messageSplitRegex).Groups[1].Value.ToLower();
    }

    public static string Reformat(string logLine)
    {
        // https://stackoverflow.com/questions/63322784/c-sharp-how-to-treat-a-string-variable-as-interpolated-string
        return string.Format("{0} ({1})",Message(logLine),LogLevel(logLine));
    }

}
